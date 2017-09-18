unit UnitTrans;

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls, IniFiles, UnboundMemo;

type
  TFormTranslate = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    procedure SaveIniFile;
    procedure ReadIniFile;
  public
    MemoTranslate : TUnboundMemo;
    procedure Translate;
  end;

var
  FormTranslate: TFormTranslate;

implementation

uses UnitLang, UnitLib;

{$R *.lfm}

procedure TFormTranslate.Translate;
begin
  Caption := ' ' + T('Menu.Translate');
 end;

procedure TFormTranslate.FormCreate(Sender: TObject);
begin
  MemoTranslate := TUnboundMemo.Create(self);

  with MemoTranslate do
  begin
    Parent := FormTranslate;
    Align := alClient;
    HideSelection := False;
    ScrollBars := ssBoth;
    ReadOnly := True;
  end;

  ReadIniFile;
end;

procedure TFormTranslate.FormDestroy(Sender: TObject);
begin
  SaveIniFile;
  MemoTranslate.Free;
end;

procedure TFormTranslate.SaveIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ConfigFile);

  if WindowState = wsNormal then
    begin
      IniFile.WriteInteger('Translation', 'Left',   FormTranslate.Left);
      IniFile.WriteInteger('Translation', 'Top',    FormTranslate.Top);
      IniFile.WriteInteger('Translation', 'Width',  FormTranslate.Width);
      IniFile.WriteInteger('Translation', 'Height', FormTranslate.Height);
    end;

  IniFile.Free;
end;

procedure TFormTranslate.ReadIniFile;
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ConfigFile);

  Height := IniFile.ReadInteger('Translation', 'Height', Screen.Height - 400);
  Width := IniFile.ReadInteger('Translation', 'Width', 300);
  Left := IniFile.ReadInteger('Translation', 'Left', 500);
  Top := IniFile.ReadInteger('Translation', 'Top', 120);

  IniFile.Free;
end;

end.

