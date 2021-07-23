unit UnitTools;

interface

uses SysUtils, Classes, Controls, Graphics, ClipBrd, LazUtf8, IniFiles, UnitLib,
  UnitModule, UnitBible, UnitCommentary, UnitDictionary, UnitReference;

type
  TCopyOptions = record
    cvAbbreviate, cvEnumerated, cvGuillemets, cvParentheses, cvEnd, cvCopyNoFormat, cvNewLine : boolean;
  end;

  TTools = class
    Bibles : TBibles;
    Commentaries : TCommentaries;
    Dictionaries : TDictionaries;
  private
    References : TReferences;
  public
    constructor Create;
    destructor Destroy; override;
    function Get_Chapter: string;
    function Get_Search(st: string; out count: integer): string;
    function Get_Compare: string;
    function Get_Reference(out info: string): string;
    function Get_Commentary: string;
    function Get_Dictionary(st: string = ''): string;
    function Get_Strong(number: string = ''): string;
    function Get_Footnote(marker: string = ''): string;
    function Get_Verses: string;
    procedure SetCurrBible(Value: string);
    procedure Get_Modules(const Modules: TModules);
    procedure DeleteModule(const Module: TModule);
  private
    procedure SaveConfig;
    procedure ReadConfig;
  end;

var
  CurrBible : TBible = nil;
  CurrVerse : TVerse;
  Options : TCopyOptions;
  Tools : TTools;

implementation

uses
  FormSearch, UnitUtils;

constructor TTools.Create;
begin
  Bibles := TBibles.Create;
  Commentaries := TCommentaries.Create;
  Dictionaries := TDictionaries.Create;
  References := TReferences.Create;
  ReadConfig;
end;

destructor TTools.Destroy;
begin
  SaveConfig;
  References.Free;
  Dictionaries.Free;
  Commentaries.Free;
  Bibles.Free;
end;

function TTools.Get_Chapter: string;
var
  Strings : TStringArray;
  i : integer;
begin
  Result := '';
  if CurrBible.RightToLeft then Result += '<rtl>';
  Strings := CurrBible.GetChapter(CurrVerse);

  for i:=Low(Strings) to High(Strings) do
    Result += '<l> ' + ToStr(i+1) + '</l> ' + Strings[i] + '<br>';
end;

procedure Highlight(var s: string; target: string; Options: TSearchOptions);
var
  Arr : TIntegerArray;
  t : string;
  i,len : integer;
begin
  t := s;
  len := Length(target);

  if not (caseSensitive in Options) then t := Utf8LowerCase(t);
  if wholeWords in Options then t := ' ' + CleanString(t) + ' ';
  if wholeWords in Options then target := ' ' + target + ' ';

  Arr := StringPos(target,t);

  for i:= High(Arr) downto Low(Arr) do
    begin
      Insert('</r>', s, Arr[i] + len);
      Insert( '<r>', s, Arr[i]);
    end;
end;

procedure Highlights(var s: string; searchString: string; Options: TSearchOptions);
var
  List : TStringArray;
  item : string;
begin
  if not (caseSensitive in Options) then searchString := Utf8LowerCase(searchString);
  List := searchString.Split(' ');
  for item in List do Highlight(s, item, Options);
end;

function TTools.Get_Search(st: string; out count: integer): string;
var
  ContentArray : TContentArray;
  content : TContent;
  link, text : string;
begin
  Result := '';
  ContentArray := CurrBible.Search(st, CurrentSearchOptions, CurrentSearchRange);
  count := Length(ContentArray);

  for content in ContentArray do
    begin
      link := CurrBible.VerseToStr(content.verse,true);
      text := content.text;
      if CurrBible.accented then Replace(text,AcuteChar,'');

      Highlights(text,st,CurrentSearchOptions);
      text := '<l>' + link + '</l>' + ' ' + text + '<br><br>';
      Result += text;
    end;
end;

function TTools.Get_Compare: string;
var
  Bible : TBible;
  s : string;
begin
  Result := '';

  for Bible in Bibles do
    if Bible.compare then
      begin
        s := ''.Join(' ', Bible.GetRange(CurrVerse));
        if s.isEmpty then Continue;
        Result += '<br><l>' + Bible.Name + '</l><br>' + s + '<br>';
      end;
end;

function TTools.Get_Reference(out info: string): string;
var
  Verses : TVerseArray;
  item : TVerse;
  link : string;
begin
  Result := '';
  Verses := References.GetData(CurrVerse, CurrBible.language, info);

  for item in Verses do
    begin
      link := CurrBible.VerseToStr(item, not Options.cvAbbreviate);
      if link.isEmpty then Continue;
      Result += '<l>' + link + '</l> ' + ''.Join(' ', CurrBible.GetRange(item)) + '<br><br>';
    end;
end;

function TTools.Get_Commentary: string;
var
  Commentary : TCommentary;
  Strings : TStringArray;
  item : string;
begin
  Result := '';

  for Commentary in Commentaries do
    begin
      if Commentary.footnotes then Continue;
      Strings := Commentary.GetData(CurrVerse);
      if Strings.IsEmpty then Continue;
      Result += '<h>' + Commentary.Name + '</h><br><br>';
      for item in Strings  do Result += '<tab>' + item + '<br>';
      Result += '<br>';
    end;
end;

function TTools.Get_Dictionary(st: string = ''): string;
var
  Dictionary : TDictionary;
  Strings : TStringArray;
  item : string;
begin
  Result := '';
  if st.isEmpty then Exit;

  for Dictionary in Dictionaries do
    begin
      if Dictionary.embedded then Continue;
      Strings := Dictionary.GetData(st);
      if Strings.IsEmpty then Continue;
      Result += '<h>' + Dictionary.Name + '</h><br><br>';
      for item in Strings do Result += '<tab>' + item + '<br>';
      Result += '<br>';
    end;
end;

function TTools.Get_Strong(number: string = ''): string;
begin
  Result := Dictionaries.GetStrong(CurrVerse, CurrBible.language, number);
end;

function TTools.Get_Footnote(marker: string = ''): string;
begin
  if CurrBible.format = mybible
    then Result := Commentaries.GetFootnote(CurrBible.fileName, CurrVerse, marker)
    else Result := CurrBible.GetFootnote(CurrVerse, marker);
end;

function TTools.Get_Verses: string;
var
  Book : TBook;
  List : TStringArray;
  quote : string = '';
  line, link, n : string;
  number : integer;
  l : boolean = False;
  linkDelim : string = ' ';
begin
  if CurrBible.RightToLeft then Result := '<rtl>' else Result := '';

  Book := CurrBible.BookByNum(CurrVerse.Book);
  if not Assigned(Book) then Exit;

  List := CurrBible.GetRange(CurrVerse);
  number := CurrVerse.number;

  for line in List do
    begin
      if Options.cvEnumerated and (CurrVerse.Count > 1) then
        if l or (not l and Options.cvEnd) then
          begin
            n := ToStr(number);
            if Options.cvParentheses then n := '(' + n + ')';
            quote += n + ' ';
          end;

      quote += line + ' ';
      number += 1;
      l := True;
    end;

  quote := Trim(quote);
  if Options.cvGuillemets then quote := '«' + quote + '»';

  link := CurrBible.VerseToStr(CurrVerse, not Options.cvAbbreviate);
  link := '<l>' + link + '</l>';
  if Options.cvNewLine then linkDelim := '<br>' else linkDelim := ' ';
  if Options.cvParentheses then link := '(' + link + ')';
  if Options.cvEnd then quote := quote + linkDelim + link else quote := link + linkDelim + quote;

  Result += quote + '<br> ';
end;

procedure TTools.SetCurrBible(Value: string);
var
  Bible : TBible;
begin
  CurrBible := Bibles[0];

  for Bible in Bibles do
    if Bible.Name = Value then
      begin
        CurrBible := Bible;
        Break;
      end;

  CurrBible.LoadDatabase;
  if not CurrBible.GoodLink(CurrVerse) then CurrVerse := CurrBible.FirstVerse;
end;

procedure TTools.Get_Modules(const Modules: TModules);
var
  Module: TModule;
begin
  for Module in Bibles       do Modules.Add(Module);
  for Module in Commentaries do Modules.Add(Module);
  for Module in Dictionaries do Modules.Add(Module);
  for Module in References   do Modules.Add(Module);
end;

procedure TTools.DeleteModule(const Module: TModule);
begin
 if Module.ClassType = TBible      then Bibles      .DeleteItem(Module as TBible      );
 if Module.ClassType = TCommentary then Commentaries.DeleteItem(Module as TCommentary );
 if Module.ClassType = TDictionary then Dictionaries.DeleteItem(Module as TDictionary );
 if Module.ClassType = TReference  then References  .DeleteItem(Module as TReference  );
end;

procedure TTools.SaveConfig;
var IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ConfigFile);

  IniFile.WriteString ('Application', 'Version', ApplicationVersion);
  IniFile.WriteString ('Application', 'CurrentBible', CurrBible.name);
  IniFile.WriteInteger('Verse', 'Book', CurrVerse.book);
  IniFile.WriteInteger('Verse', 'Chapter', CurrVerse.chapter);
  IniFile.WriteInteger('Verse', 'Number', CurrVerse.number);
  IniFile.WriteInteger('Verse', 'Count', CurrVerse.count);

  IniFile.Free;
end;

procedure TTools.ReadConfig;
var
  IniFile: TIniFile;
  Version: string;
  CurrentBible : string;
begin
  IniFile := TIniFile.Create(ConfigFile);

  Version := IniFile.ReadString('Application', 'Version', '');
  ApplicationUpdate := ApplicationVersion <> Version;
  CurrentBible := IniFile.ReadString('Application', 'CurrentBible', Bibles.GetDefaultBible);
  SetCurrBible(CurrentBible);

  CurrVerse.book    := IniFile.ReadInteger('Verse', 'Book',    0);
  CurrVerse.chapter := IniFile.ReadInteger('Verse', 'Chapter', 0);
  CurrVerse.number  := IniFile.ReadInteger('Verse', 'Number',  0);
  CurrVerse.count   := IniFile.ReadInteger('Verse', 'Count',   0);

  IniFile.Free;
end;

initialization
  RemoveOldFiles;
  UnzipDefaultsFiles;
  Tools := TTools.Create;

finalization
  Tools.Free;

end.
