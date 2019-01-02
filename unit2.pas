unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Buttons, DBGrids, Unit3,SysUtils;

type

  { TForm2 }

  TForm2 = class(TForm)
    DBGrid2: TDBGrid;
    SpeedButton1: TSpeedButton;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  ModalResult:=mrOK;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
   DataModule1.dbf2.Open;
   DataModule1.Dbf2.Filtered:=false;
   DBGrid2.SetFocus;
end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  DataModule1.dbf2.Close;
  ModalResult:=mrOK;
end;

end.

