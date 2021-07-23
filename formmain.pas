unit FormMain;

interface

uses
  Classes, Fgl, SysUtils, LazFileUtils, LazUTF8, Forms, Controls, Graphics, Dialogs,
  StdCtrls, Menus, ExtCtrls, ComCtrls, IniFiles, LCLIntf, LCLType, LCLProc, ActnList,
  ClipBrd, StdActns, Buttons, PrintersDlgs, Types, RichMemo, UnboundMemo,
  UnitUtils, UnitLib;

type
  TStatuses = TFPGMap<integer, string>;

  { TMainForm }

  TMainForm = class(TForm)
    Edit: TEdit;
    IdleTimer: TIdleTimer;
    miIssue: TMenuItem;
    miDonate: TMenuItem;
    MenuItem2: TMenuItem;
    miRrefx: TMenuItem;
    miDictionaries: TMenuItem;
    N7: TMenuItem;
    PrintDialog: TPrintDialog;
    FontDialog: TFontDialog;
    FontDialogNotes: TFontDialog;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    ComboBox: TComboBox;
    FileOpen1: TFileOpen;
    EditCut1: TEditCut;

    MemoBible: TUnboundMemo;
    MemoSearch: TUnboundMemo;
    MemoCompare: TUnboundMemo;
    MemoReference: TUnboundMemo;
    MemoCommentary: TUnboundMemo;
    MemoDictionary: TUnboundMemo;
    MemoNotes: TUnboundMemo;

    ActionAbout: THelpAction;
    ActionBold: TAction;
    ActionBullets: TAction;
    ActionCenter: TAction;
    ActionCommentaries: TAction;
    ActionCompare: TAction;
    ActionCopyAs: TAction;
    ActionCopyVerses: TAction;
    ActionDecrease: TAction;
    ActionDictionaries: TAction;
    ActionEditCopy: TAction;
    ActionEditCut: TAction;
    ActionEditDel: TAction;
    ActionEditFont: TAction;
    ActionEditPaste: TAction;
    ActionEditSelAll: TEditSelectAll;
    ActionEditUndo: TAction;
    ActionExit: TAction;
    ActionFileNew: TAction;
    ActionFileOpen: TAction;
    ActionFilePrint: TAction;
    ActionFileSave: TAction;
    ActionFileSaveAs: TAction;
    ActionFont: TAction;
    ActionIncrease: TAction;
    ActionInterlinear: TAction;
    ActionItalic: TAction;
    ActionLeft: TAction;
    ActionLink: TAction;
    ActionList: TActionList;
    ActionLookup: TAction;
    ActionModules: TAction;
    ActionOptions: TAction;
    ActionReference: TAction;
    ActionRight: TAction;
    ActionSearch: TAction;
    ActionSearchfor: TAction;
    ActionUnderline: TAction;

    ChapterBox: TListBox;
    BookBox: TListBox;
    Ruler: TPanel;
    PanelLeft: TPanel;
    Splitter: TSplitter;
    StatusBar: TStatusBar;
    Images: TImageList;

    PageControl: TPageControl;
    TabSheetReference: TTabSheet;
    TabSheetBible: TTabSheet;
    TabSheetSearch: TTabSheet;
    TabSheetCompare: TTabSheet;
    TabSheetCommentary: TTabSheet;
    TabSheetDictionary: TTabSheet;
    TabSheetNotes: TTabSheet;

    MainMenu: TMainMenu;
    miBibleFolder: TMenuItem;
    miClear: TMenuItem;
    miCommentaries: TMenuItem;
    miCompare: TMenuItem;
    miCopy: TMenuItem;
    miCopyAs: TMenuItem;
    miCut: TMenuItem;
    miDownload: TMenuItem;
    miEdit: TMenuItem;
    miExit: TMenuItem;
    miHelp: TMenuItem;
    miHelpAbout: TMenuItem;
    miHome: TMenuItem;
    miLocalization: TMenuItem;
    miNoteNew: TMenuItem;
    miNoteOpen: TMenuItem;
    miNotes: TMenuItem;
    miNoteSave: TMenuItem;
    miNoteSaveAs: TMenuItem;
    miOptions: TMenuItem;
    miPaste: TMenuItem;
    miPrint: TMenuItem;
    miRecent: TMenuItem;
    miSearch: TMenuItem;
    miSelectAll: TMenuItem;
    miTools: TMenuItem;
    miUndo: TMenuItem;
    miModules: TMenuItem;
    miVerses: TMenuItem;
    miInterlinear: TMenuItem;
    miTranslate: TMenuItem;

    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N9: TMenuItem;

    PopupMenu: TPopupMenu;
    pmSearchfor: TMenuItem;
    pmCut: TMenuItem;
    pmCopy: TMenuItem;
    pmPaste: TMenuItem;
    pmCopyAs: TMenuItem;
    pmVerses: TMenuItem;
    pmLookup: TMenuItem;
    pmSeparator: TMenuItem;
    pmSeparator2: TMenuItem;

    StandardToolBar: TToolBar;
    ToolPanel: TPanel;
    ToolButtonBold: TToolButton;
    ToolButtonBullets: TToolButton;
    ToolButtonCenter: TToolButton;
    ToolButtonCommentary: TToolButton;
    ToolButtonFavorites: TToolButton;
    ToolButtonCopy: TToolButton;
    ToolButtonCopyright: TToolButton;
    ToolButtonCut: TToolButton;
    ToolButtonDictionary: TToolButton;
    ToolButtonFont: TToolButton;
    ToolButtonItalic: TToolButton;
    ToolButtonLeft: TToolButton;
    ToolButtonLink: TToolButton;
    ToolButtonNew: TToolButton;
    ToolButtonOpen: TToolButton;
    ToolButtonPaste: TToolButton;
    ToolButtonPrint: TToolButton;
    ToolButtonReference: TToolButton;
    ToolButtonRight: TToolButton;
    ToolButtonSave: TToolButton;
    ToolButtonSearch: TToolButton;
    ToolButtonUnderline: TToolButton;
    ToolButtonUndo: TToolButton;
    ToolButtonVerses: TToolButton;
    ToolSeparator1: TToolButton;
    ToolSeparator2: TToolButton;
    ToolSeparator3: TToolButton;
    ToolSeparator4: TToolButton;
    ToolSeparator5: TToolButton;
    ToolSeparator6: TToolButton;

    procedure CmdReference(Sender: TObject);
    procedure CmdCommentaries(Sender: TObject);
    procedure CmdDictionaries(Sender: TObject);
    procedure CmdAbout(Sender: TObject);
    procedure CmdCompare(Sender: TObject);
    procedure CmdCopyAs(Sender: TObject);
    procedure CmdCopyVerses(Sender: TObject);
    procedure CmdEdit(Sender: TObject);
    procedure CmdExit(Sender: TObject);
    procedure CmdFileNew(Sender: TObject);
    procedure CmdFileOpen(Sender: TObject);
    procedure CmdFilePrint(Sender: TObject);
    procedure CmdFileSave(Sender: TObject);
    procedure CmdFileSaveAs(Sender: TObject);
    procedure CmdInterline(Sender: TObject);
    procedure CmdOptions(Sender: TObject);
    procedure CmdSearch(Sender: TObject);
    procedure CmdSearchFor(Sender: TObject);
    procedure CmdLookup(Sender: TObject);
    procedure CmdStyle(Sender: TObject);
    procedure CmdStyle2(Sender: TObject);
    procedure CmdModules(Sender: TObject);

    procedure AssignFont;
    procedure ComboBoxChange(Sender: TObject);
    procedure ComboBoxDrawItem(Control: TWinControl; Index: integer; ARect: TRect; State: TOwnerDrawState);
    procedure EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure IdleTimerTimer(Sender: TObject);
    procedure BookBoxClick(Sender: TObject);
    procedure ChapterBoxClick(Sender: TObject);
    procedure MemoMouseLeave(Sender: TObject);
    procedure MemoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure MemoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
    procedure MemoSelectionChange(Sender: TObject);
    procedure miBibleFolderClick(Sender: TObject);
    procedure miDownloadClick(Sender: TObject);
    procedure miHomeClick(Sender: TObject);
    procedure miIssueClick(Sender: TObject);
    procedure miDonateClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure ToolButtonDonateClick(Sender: TObject);
    procedure ToolButtonSearchClick(Sender: TObject);
  private
    NoteFileName: string;
    RecentList: TStringArray;
    Statuses: TStatuses;
//  DonateVisited: boolean;
    IdleMessage : string;
    showed : boolean;
    function UnboundMemo: TUnboundMemo;
    function CheckFileSave: boolean;
    function SelectBible(name: string): boolean;
    procedure LoadComboBox;
    procedure EnableActions;
    procedure UpDownButtons;
    procedure SelectBook(title: string; scroll: boolean);
    procedure ShowCurrVerse(select: boolean);
    procedure LangMenuInit;
    procedure LoadChapter;
    procedure LoadSearch(s: string);
    procedure LoadCompare;
    procedure LoadReference;
    procedure LoadCommentary;
    procedure LoadDictionary(s: string);
    procedure LoadStrong(s: string);
    procedure LoadFootnote(s: string);
    procedure MakeBookList;
    procedure MakeChapterList;
    procedure OnRecentClick(Sender: TObject);
    procedure OnLangClick(Sender: TObject);
    procedure PerformFileOpen(const FileName: string);
    procedure ReadConfig;
    procedure RebuildRecentList;
    procedure RecentMenuInit;
    procedure HideCursor;
    procedure SaveConfig;
    procedure SelectPage(page: integer);
    procedure UpdateCaption(s: string);
    procedure RefreshStatus;
    procedure UpdateStatus(s: string);
    procedure UpdateActionImage;
    procedure VersesToClipboard;
    procedure ShowPopup;
    procedure Localize;
    procedure LocalizeApplication;
  end;

var
  MainForm: TMainForm;

implementation

uses
  {$ifdef windows} UmParseWin, {$endif}
  FormAbout, FormNotify, FormSearch, FormCompare, UnitTools, UnitLocal, FormCopy, FormShelf,
  UnitModule, UnitBible, UnitCommentary, UnitDictionary;

const
  apBible        = 0; // active page
  apSearch       = 1;
  apCompare      = 2;
  apReferences   = 3;
  apCommentaries = 4;
  apDictionaries = 5;
  apNotes        = 6;

{$R *.lfm}

//=================================================================================================
//                                     Create Main Form
//=================================================================================================

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Localization := TLocalization.Create;
  Statuses := TStatuses.Create;

  Caption := ApplicationName + ' ' + ApplicationVersion;
  RecentList := [];
  showed := False;

  SaveDialog.InitialDir := DocumentsPath;
  NoteFileName := Untitled;

  ReadConfig;
  AssignFont;
  LoadComboBox;
  MakeBookList;
  if not CurrBible.GoodLink(CurrVerse) then CurrVerse := CurrBible.FirstVerse;
  UpdateStatus(CurrBible.Info);

  // LoadChapter; // RichMemo doesn't load from Stream,
                  // so we call it from FormShow

  LangMenuInit;
  RecentMenuInit;

  NoteFileName := Untitled;
  MemoNotes.Lines.Clear;
  MemoNotes.Font.Size := Font.Size;
//ToolButtonDonate.Visible := not DonateVisited;
  IdleMessage := '';

  {$ifdef windows}
    TabSheetSearch    .TabVisible := False;
    TabSheetReference .TabVisible := False;
    TabSheetCommentary.TabVisible := False;
    TabSheetDictionary.TabVisible := False;
    IdleTimer.Interval := 50;
  {$endif}

  {$ifdef linux}
    Font.Name := 'default';
    Font.Size := 11;
    StandardToolBar.ParentColor := True;
    ToolPanel.Color := clForm;
    ActionFilePrint.Visible := False;
    ActionEditUndo.Visible := False;
    ActionBullets.Visible := False;
    ToolSeparator6.Visible := False;
  {$endif}

  UpdateActionImage;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  SaveConfig;
  Statuses.Free;
  Localization.Free;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if not showed then // first time
    begin
      LocalizeApplication;
      {$ifdef linux}
        TabSheetSearch    .TabVisible := False;
        TabSheetReference .TabVisible := False;
        TabSheetCommentary.TabVisible := False;
        TabSheetDictionary.TabVisible := False;
      {$endif}
      ShowCurrVerse(CurrVerse.number > 1);
      showed := True;
    end;

  {$ifdef windows} IdleMessage := 'HideCursor'; {$endif}
end;

procedure TMainForm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  {$ifdef linux}
    MemoBible     .Clear;
    MemoSearch    .Clear;
    MemoCompare   .Clear;
    MemoReference .Clear;
    MemoCommentary.Clear;
    MemoDictionary.Clear;
    MemoNotes     .Clear;
  {$endif}
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  try
    CanClose := CheckFileSave;
  except
    CanClose := False;
  end;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  ToolPanel.Width := StandardToolBar.Width - ToolButtonRight.Width - ToolButtonSearch.Width
                   - {$ifdef linux} ToolButtonRight.Left {$else} ToolButtonBullets.Left {$endif};

  Edit.Left := StandardToolBar.Width - ToolButtonSearch.Width - Edit.Width - 4;
  Edit.Visible := ToolPanel.Width > Edit.Width;
end;

procedure TMainForm.MemoMouseLeave(Sender: TObject);
var
  Point : TPoint;
begin
  if NotifyForm.Visible then
    begin
      Point := UnboundMemo.ScreenToClient(Mouse.CursorPos);
      if (Point.x <= 0) or (Point.x >= UnboundMemo.Width  - 30) or
         (Point.y <= 0) or (Point.y >= UnboundMemo.Height - 30) then NotifyForm.Close;
    end;
end;

procedure TMainForm.AssignFont;
begin
  MemoBible.Font.Assign(Font);
  MemoSearch.Font.Assign(Font);
  MemoCompare.Font.Assign(Font);
  MemoReference.Font.Assign(Font);
  MemoCommentary.Font.Assign(Font);
  MemoDictionary.Font.Assign(Font);
end;

procedure TMainForm.Localize;
begin
  miTools.Caption := T('Tools');
  miEdit.Caption := T('Edit');
  miNotes.Caption := T('Notes');
  miHelp.Caption := T('Help');
  miSearch.Caption := T('Search');
  miCompare.Caption := T('Compare');
  miRrefx.Caption := T('Cross-References');
  miCommentaries.Caption := T('Commentaries');
  miDictionaries.Caption := T('Dictionaries');
  miTranslate.Caption := T('Translation');
  miInterlinear.Caption := T('Interlinear') + ' (biblehub.com)';
  miPrint.Caption := T('Print');
  miModules.Caption := T('Modules');
  miOptions.Caption := T('Font…');
  miLocalization.Caption := T('Localization');
  miExit.Caption := T('Exit');
  miUndo.Caption := T('Undo');
  miCut.Caption := T('Cut');
  miCopy.Caption := T('Copy');
  miPaste.Caption := T('Paste');
  miClear.Caption := T('Delete');
  miSelectAll.Caption := T('Select All');
  miCopyAs.Caption := T('Copy As…');
  miVerses.Caption := T('Copy Verses');
  miNoteNew.Caption := T('New');
  miNoteOpen.Caption := T('Open…');
  miNoteSave.Caption := T('Save');
  miNoteSaveAs.Caption := T('Save As…');
  miRecent.Caption := T('Open Recent');

  miHome.Caption := T('Home Page');
  miDonate.Caption := T('Donate');
  miDownload.Caption := T('Modules Downloads');
  miBibleFolder.Caption := T('Bible Folder');
  miIssue.Caption := T('Report an Issue');
  miHelpAbout.Caption := T('About');

  pmCut.Caption := T('Cut');
  pmCopy.Caption := T('Copy');
  pmPaste.Caption := T('Paste');
  pmCopyAs.Caption := T('Copy As…');
  pmVerses.Caption := T('Copy Verses');

  TabSheetBible.Caption := T('Bible');
  TabSheetSearch.Caption := T('Search');
  TabSheetCompare.Caption := T('Compare');
  TabSheetReference.Caption := T('Cross-References');
  TabSheetCommentary.Caption := T('Commentaries');
  TabSheetDictionary.Caption := T('Dictionaries');
  TabSheetNotes.Caption := T('Notes');

  ToolButtonNew.Hint := T('New');
  ToolButtonOpen.Hint := T('Open');
  ToolButtonSave.Hint := T('Save');
  ToolButtonPrint.Hint := T('Print');
  ToolButtonSearch.Hint := T('Search Options');
  ToolButtonCut.Hint := T('Cut');
  ToolButtonCopy.Hint := T('Copy');
  ToolButtonVerses.Hint := T('Copy Verses');
  ToolButtonPaste.Hint := T('Paste');
  ToolButtonUndo.Hint := T('Undo');

  ToolButtonFavorites.Hint := T('Compare');
  ToolButtonReference.Hint := T('Cross-References');
  ToolButtonCommentary.Hint := T('Commentaries');
  ToolButtonDictionary.Hint := T('Dictionaries');

  ToolButtonFont.Hint := T('Font');
  ToolButtonBold.Hint := T('Bold');
  ToolButtonItalic.Hint := T('Italic');
  ToolButtonUnderline.Hint := T('Underline');
  ToolButtonLink.Hint := T('Hyperlink');
  ToolButtonLeft.Hint := T('Align Left');
  ToolButtonCenter.Hint := T('Center');
  ToolButtonRight.Hint := T('Align Right');
  ToolButtonBullets.Hint := T('Bullets');
end;

procedure TMainForm.LocalizeApplication;
begin
  MainForm   .Localize;
  SearchForm .Localize;
  CompareForm.Localize;
  AboutBox   .Localize;
  CopyForm   .Localize;
  ShelfForm  .Localize;
end;

//-------------------------------------------------------------------------------------------------
//                                       Actions
//-------------------------------------------------------------------------------------------------

procedure TMainForm.CmdAbout(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TMainForm.CmdStyle(Sender: TObject);
var
  fp: TFontParams;
begin
  fp := MemoNotes.SelAttributes;
  MemoNotes.SaveSelection;
  if MemoNotes.SelLength = 0 then MemoNotes.SelectWord;

  if Sender = ActionBold then
    if fsBold in fp.Style then fp.Style := fp.Style - [fsBold]
                          else fp.Style := fp.Style + [fsBold];

  if Sender = ActionItalic then
    if fsItalic in fp.Style then fp.Style := fp.Style - [fsItalic]
                            else fp.Style := fp.Style + [fsItalic];

  if Sender = ActionUnderline then
    if fsUnderline in fp.Style then fp.Style := fp.Style - [fsUnderline]
                               else fp.Style := fp.Style + [fsUnderline];

  if Sender = ActionLink then
    if fp.Color = clNavy then fp.Color := clBlack
                         else fp.Color := clNavy;

//if Sender = ActionSuper then
//  if fp.vScriptPos = vpSuperscript then fp.vScriptPos := vpNormal
//                                   else fp.vScriptPos := vpSuperscript;

  if Sender = ActionIncrease then fp.Size += 1;
  if Sender = ActionDecrease then fp.Size -= 1;

  if Sender = ActionFont then
    begin
      FontDialogNotes.Font.Name  := fp.Name;
      FontDialogNotes.Font.Size  := fp.Size;
      FontDialogNotes.Font.Style := fp.Style;
      FontDialogNotes.Font.Color := fp.Color;

      if FontDialogNotes.Execute then
        begin
          fp.Name  := FontDialogNotes.Font.Name;
          fp.Size  := FontDialogNotes.Font.Size;
          fp.Style := FontDialogNotes.Font.Style;
          fp.Color := FontDialogNotes.Font.Color;
        end;
    end;

  MemoNotes.SetTextAttributes(MemoNotes.SelStart, MemoNotes.SelLength, fp);
  MemoNotes.RestoreSelection; // unselect word
  MemoNotes.Repaint;
end;

procedure TMainForm.CmdStyle2(Sender: TObject);
{$ifdef windows} var pn : TParaNumbering; {$endif}
begin
  with MemoNotes do
    begin
      if Sender = ActionLeft    then SetParaAlignment(SelStart, SelLength, paLeft   );
      if Sender = ActionCenter  then SetParaAlignment(SelStart, SelLength, paCenter );
      if Sender = ActionRight   then SetParaAlignment(SelStart, SelLength, paRight  );

      {$ifdef windows}
      if Sender = ActionBullets then
        begin
          pn := SelParaNumbering;
          if pn.Style = pnNone then pn.Style := pnBullet else pn.Style := pnNone;
          SetParaNumbering(SelStart, SelLength, pn);
        end;
      {$endif}
    end;

  MemoNotes.Repaint;
end;

procedure TMainForm.ComboBoxChange(Sender: TObject);
var
  select : boolean;
begin
  Tools.SetCurrBible( ComboBox.Items[ComboBox.ItemIndex] ) ;
  MakeBookList;
  select := CurrVerse.number > 1;
  {$ifdef linux}
    IdleMessage := 'ShowCurrVerse(' + ToStr(select) + ')';
  {$else}
    ShowCurrVerse(select);
  {$endif}
  SelectPage(apBible);
  UpdateStatus(CurrBible.Info);
end;

procedure TMainForm.ComboBoxDrawItem(Control: TWinControl; Index: integer; ARect: TRect; State: TOwnerDrawState);
begin
  ComboBox.canvas.fillrect(ARect);
  Canvas.TextOut(ARect.Left + 5, ARect.Top, ComboBox.Items[Index]);
  Canvas.TextOut(ARect.Left + 220, ARect.Top, '[ru]');
end;

procedure TMainForm.EditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    if PageControl.ActivePageIndex = apDictionaries then LoadDictionary(Edit.Text)
      else LoadSearch(Edit.Text);
end;

procedure TMainForm.CmdCompare(Sender: TObject);
begin
  if Sender <> PageControl then
    if CompareForm.ShowModal <> mrOk then Exit;
  LoadCompare;
end;

procedure TMainForm.CmdInterline(Sender: TObject);
var path : string;
begin
  path := BibleHubURL(CurrVerse.book, CurrVerse.chapter, CurrVerse.number);
  if path <> '' then OpenURL(path);
end;

procedure TMainForm.CmdEdit(Sender: TObject);
begin
  if Sender = ActionEditCopy   then UnboundMemo.CopyToClipboard;
  if Sender = ActionEditPaste  then UnboundMemo.PasteFromClipboard;
  if Sender = ActionEditDel    then UnboundMemo.ClearSelection;
  if Sender = ActionEditUndo   then UnboundMemo.Undo;

  if Sender = ActionEditSelAll then
    begin
      UnboundMemo.SelectAll;
      CurrVerse.Number := MemoBible.ParagraphStart;
      CurrVerse.Count  := MemoBible.ParagraphCount;
   end;

  if Sender = ActionEditCut then
    begin
      UnboundMemo.CopyToClipboard;
      UnboundMemo.ClearSelection;
    end;

  EnableActions;
end;

procedure TMainForm.CmdCopyAs(Sender: TObject);
begin
  // saving selection because of strange bug in the gtk2's richmemo
  {$ifdef linux} MemoBible.SaveSelection; {$endif}
  CopyForm.Memo.Font.Assign(Font);
  CopyForm.ShowModal;
  {$ifdef linux} MemoBible.RestoreSelection; {$endif}
end;

procedure TMainForm.CmdCopyVerses(Sender: TObject);
begin
  {$ifdef linux} MemoBible.SaveSelection; {$endif}
  VersesToClipboard;
  {$ifdef linux} MemoBible.RestoreSelection; {$endif}
end;

procedure TMainForm.CmdSearch(Sender: TObject);
begin
  Edit.SetFocus;
end;

procedure TMainForm.CmdSearchFor(Sender: TObject);
begin
  Edit.Text := Trim(UnboundMemo.SelText);
  LoadSearch(Edit.Text);
end;

procedure TMainForm.CmdReference(Sender: TObject);
begin
  LoadReference;
end;

procedure TMainForm.CmdCommentaries(Sender: TObject);
var
  Response : integer;
begin
  if Tools.Commentaries.FootnotesOnly then
    begin
      Response := QuestionDlg(T('Commentaries'),
        T('You don''t have any commentary modules.'), mtCustom,
          [mrYes, T('Download'), mrNo, T('Cancel')], '');
      if Response = idYes then OpenURL(DownloadsURL);
      Exit;
    end;

  LoadCommentary;
end;

procedure TMainForm.CmdLookup(Sender: TObject);
begin
  Edit.Text := Trim(UnboundMemo.SelText);
  CmdDictionaries(Sender);
end;

procedure TMainForm.CmdDictionaries(Sender: TObject);
begin
  if Tools.Dictionaries.EmbeddedOnly then
    begin
      if QuestionDlg(T('Dictionaries'),
        T('You don''t have any dictionary modules.'), mtCustom,
          [mrYes, T('Download'), mrNo, T('Cancel')], '') = idYes then
            OpenURL(DownloadsURL);
      Exit;
    end;

  LoadDictionary(Edit.Text);
end;

procedure TMainForm.CmdFileNew(Sender: TObject);
begin
  SelectPage(apNotes);
  if not CheckFileSave then Exit;
  NoteFileName := Untitled;
  MemoNotes.Lines.Clear;
  MemoNotes.Modified := False;
  UpdateCaption(NoteFileName);
end;

procedure TMainForm.CmdFileOpen(Sender: TObject);
begin
  if not CheckFileSave then Exit;
  if OpenDialog.Execute then
  begin
    PerformFileOpen(OpenDialog.FileName);
    MemoNotes.ReadOnly := ofReadOnly in OpenDialog.Options;
  end;
end;

procedure TMainForm.CmdFileSave(Sender: TObject);
begin
  SelectPage(apNotes);
  if not MemoNotes.Modified then Exit;
  if NoteFileName = Untitled then
    CmdFileSaveAs(Sender)
  else
  begin
    MemoNotes.SaveToFile(NoteFileName);
    MemoNotes.Modified := False;
  end;
end;

procedure TMainForm.CmdFileSaveAs(Sender: TObject);
begin
  SelectPage(apNotes);
  if NoteFileName = Untitled then SaveDialog.InitialDir := DocumentsPath
                             else SaveDialog.InitialDir := ExtractFilePath(NoteFileName);

  if not SaveDialog.Execute then Exit;

  if not SaveDialog.FileName.Contains('.rtf') then
    SaveDialog.FileName := SaveDialog.FileName + '.rtf';

  if FileExists(SaveDialog.FileName) then
    if QuestionDlg(' ' + T('Confirmation'),
      Format(T('OK to overwrite %s?'), [SaveDialog.FileName]), mtWarning,
        [mrYes, T('Yes'), mrNo, T('No'), 'IsDefault'], 0) <> idYes then Exit;

  MemoNotes.SaveToFile(SaveDialog.FileName);
  NoteFileName := SaveDialog.FileName;

  RebuildRecentList;

  MemoNotes.Modified := False;
  UpdateCaption(ExtractOnlyName(NoteFileName));
end;

procedure TMainForm.CmdFilePrint(Sender: TObject);
var
  Params : TPrintParams;
begin
  InitPrintParams(Params{%H-});
  if PrintDialog.Execute then UnboundMemo.Print(Params);
end;

procedure TMainForm.CmdModules(Sender: TObject);
begin
  ShelfForm.ShowModal;
  LoadComboBox;
end;

procedure TMainForm.CmdExit(Sender: TObject);
begin
  Close
end;

//-------------------------------------------------------------------------------------------------
//                                         Events
//-------------------------------------------------------------------------------------------------

procedure TMainForm.BookBoxClick(Sender: TObject);
var
  Book : TBook;
  name : string;
begin
  if BookBox.Count = 0 then Exit;
  name := BookBox.Items[BookBox.ItemIndex];

  Book := CurrBible.BookByName(name);
  if not Assigned(Book) then Exit;

  CurrVerse.Init;
  CurrVerse.Book := Book.Number;

  MakeChapterList;
  LoadChapter;
end;

procedure TMainForm.ChapterBoxClick(Sender: TObject);
begin
  CurrVerse.Chapter := ChapterBox.ItemIndex + 1;
  CurrVerse.Number := 1;
  CurrVerse.Count := 1;
  LoadChapter;
end;

procedure TMainForm.MemoMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
var
  Memo : TUnboundMemo;
  Verse : TVerse;
begin
  Memo := Sender as TUnboundMemo;

  if Button = mbRight then ShowPopup;
  if Button <> mbLeft then Exit;

  if Memo = MemoBible then
    begin
      CurrVerse.Number := MemoBible.ParagraphStart;
      CurrVerse.Count  := MemoBible.ParagraphCount;
    end;

  if Memo.hyperlink.isEmpty then Exit;

  if Memo.Foreground = fgLink then
    if SelectBible(Memo.hyperlink) then Exit;

  if Memo.Foreground = fgLink then
    begin
      Verse := CurrBible.SrtToVerse(Memo.hyperlink);
      if not CurrBible.GoodLink(Verse) then Exit;
      CurrVerse := Verse;
      ShowCurrVerse(True);
    end;

  if Memo = MemoBible then
    if Memo.Foreground = fgFootnote then LoadFootnote(Memo.hyperlink);

  if Memo <> MemoNotes then
    if Memo.Foreground = fgStrong then LoadStrong(Memo.hyperlink);
end;

procedure TMainForm.MemoSelectionChange(Sender: TObject);
begin
  EnableActions;
  if Sender = MemoNotes then UpDownButtons;
end;

procedure TMainForm.MemoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
begin
  Handled := True; // disable system popup menu
end;

//-------------------------------------------------------------------------------------------------

procedure TMainForm.LoadComboBox;
var
  List : TStringArray;
  item : string;
begin
  ComboBox.Items.Clear;
  List := Tools.Bibles.GetNames;

  for item in List do
    begin
      ComboBox.Items.Add(item);
      if item = CurrBible.name then ComboBox.ItemIndex := ComboBox.Items.Count - 1;
    end;
end;

procedure TMainForm.UpdateCaption(s: string);
begin
  Caption := ApplicationName + ' ' + ApplicationVersion + ' - ' + s;
end;

procedure TMainForm.RefreshStatus;
begin
  try
    StatusBar.SimpleText := ' ' + Statuses.KeyData[PageControl.ActivePageIndex];
  except
    StatusBar.SimpleText := '';
  end;
end;

procedure TMainForm.UpdateStatus(s: string);
begin
  Statuses.AddOrSetData(PageControl.ActivePageIndex, s);
  RefreshStatus;
end;

procedure TMainForm.ShowPopup;
var
  CursorPos: TPoint;
begin
  GetCursorPos(CursorPos);
  PopupMenu.Popup(CursorPos.X, CursorPos.Y);
end;

function TMainForm.SelectBible(name: string): boolean;
var
  item : string;
begin
  Result := False;
  if name.Contains(':') then Exit;

  for item in ComboBox.Items do
    if item = name then
      begin
        ComboBox.ItemIndex := ComboBox.Items.IndexOf(item);
        ComboBoxChange(nil);
        Exit(True);
      end;
end;

procedure TMainForm.SelectBook(title: string; scroll: boolean);
var
  item : string;
begin
  for item in BookBox.Items do
    if item = title then
      begin
        BookBox.ItemIndex := BookBox.Items.IndexOf(item);
        if scroll then BookBox.TopIndex := BookBox.ItemIndex;
      end;
end;

procedure TMainForm.ShowCurrVerse(select: boolean);
var
  Book : TBook;
begin
  Book := CurrBible.BookByNum(CurrVerse.Book);
  if not Assigned(Book) then Exit;

  MakeChapterList;
  LoadChapter;

  SelectBook(Book.title, TModule.IsNewTestament(CurrVerse.book));
  ChapterBox.ItemIndex := CurrVerse.Chapter - 1;

  if select then MemoBible.SelectParagraph(CurrVerse.Number);
  Repaint;
end;

function TMainForm.CheckFileSave: boolean;
var
  Response : integer;
begin
  Result := True;
  if not MemoNotes.Modified then Exit;
  SelectPage(apNotes);

  Response := QuestionDlg(' ' + T('Confirmation'), T('Save changes?'),
      mtConfirmation, [mrYes, T('Yes'), mrNo, T('No'), mrCancel, T('Cancel'), 'IsDefault'], 0);

  // remake!!
  case Response of
    idYes:
      begin
        CmdFileSave(self);
        Result := not MemoNotes.Modified;
      end;
    idNo: {nothing};
    idCancel: Result := False;
  end;
end;

procedure TMainForm.OnRecentClick(Sender: TObject);
begin
  if CheckFileSave then PerformFileOpen(RecentList[(Sender as TMenuItem).tag]);
end;

procedure TMainForm.OnLangClick(Sender: TObject);
var
  MenuItem : TMenuItem;
begin
  Localization.id := (Sender as TMenuItem).Hint;
  for MenuItem in miLocalization do MenuItem.Checked := False;
  (Sender as TMenuItem).Checked := True;
  LocalizeApplication;
end;

procedure TMainForm.LangMenuInit;
var
  MenuItem : TMenuItem;
  Local : TLocal;
begin
  for Local in Localization do
  begin
    MenuItem := TMenuItem.Create(MainMenu);

    MenuItem.Caption := Local.language;
    MenuItem.Hint    := Local.id;
    MenuItem.Checked := Local.id = Localization.id;
    MenuItem.OnClick := OnLangClick;

    miLocalization.Add(MenuItem);
  end;
end;

procedure TMainForm.RecentMenuInit;
var
  MenuItem : TMenuItem;
  item : string;
begin
  miRecent.Enabled := RecentList.Count > 0;
  miRecent.Clear;

  for item in RecentList.Reverse do
    begin
      MenuItem := NewItem(ExtractOnlyName(item), 0, False, True, OnRecentClick, 0, '');
      MenuItem.Tag := RecentList.IndexOf(item);
      miRecent.Add(MenuItem);
    end;
end;

function TMainForm.UnboundMemo: TUnboundMemo;
begin
  case PageControl.ActivePageIndex of
    apBible        : Result := MemoBible;
    apSearch       : Result := MemoSearch;
    apCompare      : Result := MemoCompare;
    apReferences   : Result := MemoReference;
    apCommentaries : Result := MemoCommentary;
    apDictionaries : Result := MemoDictionary;
    apNotes        : Result := MemoNotes;
    else
      Result := nil;
  end;
end;

procedure TMainForm.EnableActions;
var
  B, L, M, S : boolean;
begin
  B := PageControl.ActivePageIndex = apBible;
  L := PageControl.ActivePageIndex = apNotes;
  S := UnboundMemo.SelLength > iif(B,1,0);
  M := UnboundMemo.SelText.Contains(LineBreaker); // multiline

  ActionSearchfor.Visible  := S and not M;
  ActionLookup.Visible     := S and not M;
  ActionCopyAs.Enabled     := B;
  ActionCopyVerses.Enabled := B;

  ActionEditCopy.Enabled   := S;
  ActionEditCut.Enabled    := L and S;
  ActionEditDel.Enabled    := L and S;
  ActionEditPaste.Enabled  := L and UnboundMemo.CanPaste;
  ActionEditUndo.Enabled   := L and UnboundMemo.CanUndo;

  ToolButtonNew.Enabled    := L;
  ToolButtonOpen.Enabled   := L;
  ToolButtonPrint.Enabled  := L;
  ToolButtonSave.Enabled   := L;

  ActionFont.Enabled       := L;
  ActionBold.Enabled       := L;
  ActionItalic.Enabled     := L;
  ActionUnderline.Enabled  := L;
  ActionLink.Enabled       := L;
  ActionLeft.Enabled       := L;
  ActionCenter.Enabled     := L;
  ActionRight.Enabled      := L;
  ActionBullets.Enabled    := L;

  ActionInterlinear.Enabled := B and not S and not M;
  ToolButtonSearch.Enabled  := PageControl.ActivePageIndex <> apDictionaries;

  UpdateActionImage;
end;

procedure TMainForm.UpDownButtons;
var
  fp : TFontParams;
begin
  if PageControl.ActivePageIndex <> apNotes then Exit;

  with MemoNotes do
    begin
      fp := SelAttributes;

      ToolButtonBold.Down := fsBold in fp.Style;
      ToolButtonItalic.Down := fsItalic in fp.Style;
      ToolButtonUnderline.Down := fsUnderline in fp.Style;
      ToolButtonLink.Down := clNavy = fp.Color;

      case SelParaAlignment of
        paLeft: ToolButtonLeft.Down := True;
        paRight: ToolButtonRight.Down := True;
        paCenter: ToolButtonCenter.Down := True;
      end;

      {$ifdef windows} ToolButtonBullets.Down := SelParaNumbering.Style = pnBullet; {$endif}
    end;
end;

procedure TMainForm.UpdateActionImage;
var i: integer;
begin
  with ActionList do
    for i := 0 to ActionCount - 1 do
      if TAction(Actions[i]).Tag > 0 then
        if TAction(Actions[i]).Enabled
          then TAction(Actions[i]).ImageIndex := TAction(Actions[i]).Tag
          else TAction(Actions[i]).ImageIndex := TAction(Actions[i]).Tag + 1;
end;

procedure TMainForm.RebuildRecentList;
var
  item : string;
begin
  for item in RecentList do
    if item = NoteFileName then
      RecentList.Delete(RecentList.IndexOf(item));

  RecentList.Add(NoteFileName);
  if RecentList.Count > RecentMax then RecentList.Delete(0);
  RecentMenuInit;
end;

procedure TMainForm.PerformFileOpen(const FileName: string);
begin
  if not FileExists(FileName) then Exit;
  MemoNotes.LoadFromFile(FileName);
  NoteFileName := FileName;
  RebuildRecentList;
  SelectPage(apNotes);
  MemoNotes.SetFocus;
  MemoNotes.Modified := False;
  UpdateCaption(ExtractOnlyName(NoteFileName));
end;

procedure TMainForm.SelectPage(page: integer);
begin
  if page = PageControl.ActivePageIndex then Exit;
  {$ifdef linux} PageControl.ActivePageIndex := 0; {$endif}
  PageControl.ActivePageIndex := page;
  PageControl.ActivePage.TabVisible := true;
  EnableActions;
  RefreshStatus;
  Refresh;
end;

procedure TMainForm.miBibleFolderClick(Sender: TObject);
begin
  CreateDataDirectory;
  OpenFolder(DataPath);
end;

procedure TMainForm.miHomeClick(Sender: TObject);
begin
  OpenURL(HomeURL);
end;

procedure TMainForm.miDonateClick(Sender: TObject);
begin
  OpenURL(DonateURL);
//DonateVisited := True;
end;

procedure TMainForm.miDownloadClick(Sender: TObject);
begin
  OpenURL(DownloadsURL);
end;

procedure TMainForm.miIssueClick(Sender: TObject);
begin
  OpenURL(IssueURL);
end;

procedure TMainForm.CmdOptions(Sender: TObject);
begin
  FontDialog.Font.Assign(Font);
  if FontDialog.Execute then
    begin
      Font.Assign(FontDialog.Font);
      AssignFont;
      MakeBookList;
      MakeChapterList;
      LoadChapter;
      FormPaint(self);
      Invalidate;
    end;
end;

procedure TMainForm.IdleTimerTimer(Sender: TObject);
begin
  {$ifdef windows}
  if IdleMessage = 'HideCursor' then HideCursor;
  {$endif}
  {$ifdef linux}
  if IdleMessage = 'ShowCurrVerse(True)'  then ShowCurrVerse(True);
  if IdleMessage = 'ShowCurrVerse(False)' then ShowCurrVerse(False);
  {$endif}
  IdleMessage := '';
end;

procedure TMainForm.PageControlChange(Sender: TObject);
begin
  EnableActions;
  UpDownButtons;
  RefreshStatus;
  UnboundMemo.Repaint;

  case PageControl.ActivePageIndex of
    apCompare      : CmdCompare(Sender);
    apReferences   : CmdReference(Sender);
    apCommentaries : CmdCommentaries(Sender);
    apDictionaries : CmdDictionaries(Sender);
    apNotes        : UnboundMemo.SetFocus;
  end;

  {$ifdef windows} IdleMessage := 'HideCursor'; {$endif}
end;

procedure TMainForm.PopupMenuPopup(Sender: TObject);
var s : String;
begin
  pmSeparator.Visible := ActionLookup.Visible;

  if not ActionLookup.Visible then Exit;
  s := DoubleQuotedStr( Trim(UnboundMemo.SelText) );

  pmSearchfor.Caption := StringReplace( T('Search for %'),'%',s,[]);
  pmLookup   .Caption := StringReplace( T('Look Up %')   ,'%',s,[]);
end;

procedure TMainForm.RadioButtonClick(Sender: TObject);
begin
  MakeBookList;
  MakeChapterList;
  LoadChapter;
end;

procedure TMainForm.ToolButtonDonateClick(Sender: TObject);
begin
  OpenURL(DonateURL);
//DonateVisited := True;
end;

procedure TMainForm.ToolButtonSearchClick(Sender: TObject);
var
  Pos: TPoint;
begin
  Pos.x := Width - (SearchForm.Width div 2);
  Pos.y := PageControl.Top + 2;
  Pos := ClientToScreen(Pos);
  if SearchForm.ShowAtPos(Pos) = mrOk then LoadSearch(Edit.Text);
end;

procedure TMainForm.MakeBookList;
var
  l : boolean;
begin
  l := BookBox.ItemIndex < 0;
  BookBox.BiDiMode := bdLeftToRight;
  if CurrBible.RightToLeft then BookBox.BiDiMode := bdRightToLeft;
  BookBox.Items.AddStrings(CurrBible.GetTitles, True);
  if l and (BookBox.Count > 0) then BookBox.ItemIndex := 0;
end;

//-----------------------------------------------------------------------------------------

procedure TMainForm.MakeChapterList;
var
  n, i: integer;
begin
  ChapterBox.Items.BeginUpdate;
  ChapterBox.Items.Clear;

  n := CurrBible.ChaptersCount(CurrVerse);
  for i := 1 to n do ChapterBox.Items.Add(ToStr(i));

  ChapterBox.ItemIndex := 0;
  ChapterBox.Items.EndUpdate;
end;

//----------------------------------------------------------------------------------------
//                                       Loads
//----------------------------------------------------------------------------------------

procedure TMainForm.LoadChapter;
begin
  MemoBible.LoadText(Tools.Get_Chapter, true);
  SelectPage(apBible);
end;

procedure TMainForm.LoadSearch(s: string);
var
  text : string;
  count : integer;
const
  max = {$ifdef windows}5000{$else}2000{$endif};
begin
  s := Trim(s);
  if Utf8Length(s) < 2 then Exit;

  Cursor := crHourGlass;
  text := Tools.Get_Search(s, count);

  if count = 0 then
    begin
      text := T('You search for % produced no results.');
      Replace(text,'%',DoubleQuotedStr(s));
    end;

  if count > max then text := T('This search returned too many results.') + ' ' +
                              T('Please narrow your search.');

  MemoSearch.LoadText(text);
  Cursor := crArrow;
  SelectPage(apSearch);
  UpdateStatus(ToStr(count) + ' ' + T('verses found'));
end;

procedure TMainForm.LoadCompare;
var text : string;
begin
  text := CurrBible.VerseToStr(CurrVerse, true) + '<br> ';
  text += Tools.Get_Compare;
  MemoCompare.LoadText(text);
  SelectPage(apCompare);
end;

procedure TMainForm.LoadReference;
var
  text, data: string;
  info : string = '';
begin
  text := CurrBible.VerseToStr(CurrVerse, true) + '<br><br>';
  data := Tools.Get_Reference(info);
  if data.isEmpty then text += T('Сross-references not found.') else text += data;
  MemoReference.LoadText(text);
  SelectPage(apReferences);
  UpdateStatus(info);
end;

procedure TMainForm.LoadCommentary;
var
  text, data : string;
begin
  text := CurrBible.VerseToStr(CurrVerse, true) + '<br><br>';
  data := Tools.Get_Commentary;
  text += data;

  if data.isEmpty then text += T('Commentaries not found.') + '<br><br>';

  MemoCommentary.LoadHtml(text);
  SelectPage(apCommentaries);
end;

procedure TMainForm.LoadDictionary(s: string);
var
  text : string = '';
  data : string;
begin
  s := Trim(s);
  data := Tools.Get_Dictionary(s);
  text += data;

  if data.IsEmpty and not s.IsEmpty then
    begin
      text += T('You search for % produced no results.') + '<br><br>';
      Replace(text,'%',DoubleQuotedStr(s));
    end;

  if s.isEmpty then text := T('Please enter your query in the search bar.');

  MemoDictionary.LoadHtml(text);
  SelectPage(apDictionaries);
end;

procedure TMainForm.LoadStrong(s: string);
var text : string;
begin
  text := Tools.Get_Strong(s);
  if text.isEmpty then Exit;
  NotifyForm.Title.Caption := T('Strong''s Dictionary');
  NotifyForm.Compact := True;
  NotifyForm.Memo.LoadHtml(text);
  NotifyForm.ShowAtPos(Mouse.CursorPos);
  Self.SetFocus;
end;

procedure TMainForm.LoadFootnote(s: string);
var text : string;
begin
  text := Tools.Get_Footnote(s);
  if text.isEmpty then Exit;
  NotifyForm.Title.Caption := T('Footnote');
  NotifyForm.Compact := False;
  NotifyForm.Memo.LoadHtml(text);
  NotifyForm.ShowAtPos(Mouse.CursorPos);
  Self.SetFocus;
end;

{$ifdef windows}
procedure TMainForm.VersesToClipboard;
var
  MemoPreview : TUnboundMemo;
  MemoCopy    : TMemo;
begin
  RichTextToClipboard(ParseWin(Tools.Get_Verses, Font), RemoveTags(Tools.Get_Verses));
  if Options.cvCopyNoFormat then
    begin
       MemoPreview := TUnboundMemo.Create(self);
      MemoPreview.Parent := MainForm;
      MemoPreview.Font.Assign(Font);
      MemoPreview.LoadText(Tools.Get_Verses);
      MemoPreview.SelectAll;
      MemoPreview.CopyToClipboard;
      MemoPreview.Visible := false;
      MemoPreview.FreeOnRelease;

      MemoCopy := TMemo.Create(self);
      MemoCopy.Parent := MainForm;
      MemoCopy.Visible:= false;
      MemoCopy.Clear;
      MemoCopy.PasteFromClipboard;
      MemoCopy.SelectAll;
      MemoCopy.CopyToClipboard;
      MemoCopy.FreeOnRelease;
    end;
end;
{$endif}

{$ifdef linux}
procedure TMainForm.VersesToClipboard;
var
  MemoPreview : TUnboundMemo;
  MemoCopy    : TMemo;
begin
  MemoPreview := TUnboundMemo.Create(self);
  MemoPreview.Parent := MainForm;
  MemoPreview.Font.Assign(Font);
  MemoPreview.LoadText(Tools.Get_Verses);
  MemoPreview.SelectAll;
  MemoPreview.CopyToClipboard;
  MemoPreview.Visible := false;
  MemoPreview.FreeOnRelease;
  if Options.cvCopyNoFormat then
     begin
      MemoCopy := TMemo.Create(self);
      MemoCopy.Parent := MainForm;
      MemoCopy.Visible:= false;
      MemoCopy.Clear;
      MemoCopy.PasteFromClipboard;
      MemoCopy.SelectAll;
      MemoCopy.CopyToClipboard;
      MemoCopy.FreeOnRelease;
    end;
end;
{$endif}

procedure TMainForm.HideCursor;
begin
  if PageControl.ActivePageIndex <> apNotes then UnboundMemo.HideCursor;
end;

//-------------------------------------------------------------------------------------------------

procedure TMainForm.SaveConfig;
var
  IniFile: TIniFile;
  item : string;
begin
  IniFile := TIniFile.Create(ConfigFile);

  if WindowState = wsNormal then
  begin
    IniFile.WriteInteger('Window', 'Left',   Left);
    IniFile.WriteInteger('Window', 'Top',    Top);
    IniFile.WriteInteger('Window', 'Width',  Width);
    IniFile.WriteInteger('Window', 'Height', Height);
  end;

  if WindowState = wsMaximized then IniFile.WriteString('Window', 'State', 'Maximized')
                               else IniFile.WriteString('Window', 'State', 'Normal');

  IniFile.WriteInteger('Window', 'Splitter', PanelLeft.Width);
  IniFile.WriteString ('Application', 'Interface', Localization.id);
  IniFile.WriteString ('Application', 'FontName', Font.Name);
  IniFile.WriteInteger('Application', 'FontSize', Font.Size);
//IniFile.WriteBool('Application', 'Donate', DonateVisited);
  IniFile.WriteBool('Options', 'Abbreviate', Options.cvAbbreviate);
  IniFile.WriteBool('Options', 'Enumerated', Options.cvEnumerated);
  IniFile.WriteBool('Options', 'Guillemets', Options.cvGuillemets);
  IniFile.WriteBool('Options', 'Parentheses', Options.cvParentheses);
  IniFile.WriteBool('Options', 'End', Options.cvEnd);
  IniFile.WriteBool('Options', 'NewLine', Options.cvNewLine);
  IniFile.WriteBool('Options', 'CopyNoFormat', Options.cvCopyNoFormat);
  IniFile.WriteInteger('Recent', 'Count', RecentList.Count);

  for item in RecentList do
    IniFile.WriteString('Recent', 'File_' + RecentList.IndexOf(item).ToString, item);

  IniFile.Free;
end;

procedure TMainForm.ReadConfig;
var
  IniFile: TIniFile;
  i, max: integer;
begin
  IniFile := TIniFile.Create(ConfigFile);

  Height := IniFile.ReadInteger('Window', 'Height', Screen.Height - 220);
  Width := IniFile.ReadInteger('Window', 'Width', Screen.Width - 450);
  Left := IniFile.ReadInteger('Window', 'Left', 200);
  Top := IniFile.ReadInteger('Window', 'Top', 80);

  PanelLeft.Width := IniFile.ReadInteger('Window', 'Splitter', 270);
  Localization.id := IniFile.ReadString('Application', 'Interface', Localization.DefaultID);
  Font.Name := IniFile.ReadString ('Application', 'FontName', Font.Name);
  Font.Size := IniFile.ReadInteger('Application', 'FontSize', Font.Size);
//DonateVisited := IniFile.ReadBool('Application', 'Donate', False);
  Options.cvAbbreviate := IniFile.ReadBool('Options', 'Abbreviate', False);
  Options.cvEnumerated := IniFile.ReadBool('Options', 'Enumerated', False);
  Options.cvGuillemets := IniFile.ReadBool('Options', 'Guillemets', False);
  Options.cvParentheses := IniFile.ReadBool('Options', 'Parentheses', False);
  Options.cvEnd := IniFile.ReadBool('Options', 'End', False);
  Options.cvNewLine := IniFile.ReadBool('Options', 'NewLine', False);
  Options.cvCopyNoFormat := IniFile.ReadBool('Options', 'CopyNoFormat', False);
  Max := IniFile.ReadInteger('Recent', 'Count', RecentList.Count);

  for i := 0 to Max - 1 do
    RecentList.Add(IniFile.ReadString('Recent', 'File_' + ToStr(i), ''));

  IniFile.Free;
end;

end.

