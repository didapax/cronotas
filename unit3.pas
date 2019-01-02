unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, dbf, FileUtil;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Dbf1: TDbf;
    Dbf1COLOR: TStringField;
    Dbf1COMPLETAR: TBooleanField;
    Dbf1FECHA: TDateField;
    Dbf1ID: TLongintField;
    Dbf1NOMBRE: TStringField;
    Dbf1NOTA: TMemoField;
    Dbf1PCOLOR: TStringField;
    Dbf1PROTEGER: TBooleanField;
    Dbf2: TDbf;
    Dbf2FECHA: TDateField;
    Dbf2HORAS: TStringField;
    Dbf2HX: TLongintField;
    Dbf2ID: TLongintField;
    Dbf2MX: TLongintField;
    Dbf3: TDbf;
    Dbf3ID: TLongintField;
    Dbf3RUTA: TStringField;
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

