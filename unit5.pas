unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, ExtCtrls, Buttons, Unit3;

type

  { TFormconfig }

  TFormconfig = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Panel1: TPanel;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    SpeedButton1: TSpeedButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Formconfig: TFormconfig;

implementation

{$R *.lfm}

{ TFormconfig }

procedure TFormconfig.FormShow(Sender: TObject);
begin
  DataModule1.DataSource3.DataSet.Edit;
end;

procedure TFormconfig.SpeedButton1Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then begin
    DBEdit1.Text:=SelectDirectoryDialog1.FileName;
  end;
end;

procedure TFormconfig.BitBtn1Click(Sender: TObject);
begin
  DataModule1.DataSource3.DataSet.Post;
end;

procedure TFormconfig.BitBtn2Click(Sender: TObject);
begin
  DataModule1.DataSource3.DataSet.Cancel;
end;

end.

