unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, DbCtrls, ExtCtrls,Unit3;

type

  { TForm3 }

  TForm3 = class(TForm)
    Edit1: TDBEdit;
    Label1: TLabel;
    Panel1: TPanel;
    SpeedButton1: TBitBtn;
    SpeedButton2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.FormShow(Sender: TObject);
begin
  DataModule1.DataSource1.DataSet.Edit;
  Edit1.SetFocus;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  DataModule1.DataSource1.DataSet.Post;
  ModalResult:=mrOK;
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  DataModule1.DataSource1.DataSet.Cancel;
  ModalResult:=mrCancel;
end;

end.

