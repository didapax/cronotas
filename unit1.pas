unit Unit1;

{$mode objfpc}{$H+}

interface

uses
{$IFDEF WINDOWS}
MMSystem,
{$ENDIF}
Classes, SysUtils, FileUtil, DBDateTimePicker, Forms, Controls, Graphics,
Dialogs, StdCtrls, ExtCtrls, Buttons, Clipbrd, LCLType, DBGrids, DbCtrls,
EditBtn, Menus, ActnList, db, dbf, Types, Unit2, Unit3, Unit4, LclIntf,
Unit5, process;

type
  { TForm1 }
  TForm1 = class(TForm)
    CheckCrono: TCheckBox;
    CheckTrabajo: TCheckBox;
    DBDateEdit1: TDBDateTimePicker;
    DBText1: TDBText;
    Image1: TImage;
    Image7: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Memo1: TDBMemo;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MCrosa: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MCDefault: TMenuItem;
    MCverde: TMenuItem;
    MCamarillo: TMenuItem;
    MCazul: TMenuItem;
    MCblanco: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel2: TPanel;
    Panel5: TPanel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    pcolor: TPopupMenu;
    SpeedButton6: TSpeedButton;
    BtJornada: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Timer1: TTimer;
    Timer2: TTimer;
    TrayIcon1: TTrayIcon;
    procedure BtJornadaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image9Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label6Click(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure MCamarilloClick(Sender: TObject);
    procedure MCazulClick(Sender: TObject);
    procedure MCblancoClick(Sender: TObject);
    procedure MCDefaultClick(Sender: TObject);
    procedure MCrosaClick(Sender: TObject);
    procedure MCverdeClick(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem23Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pcolorPopup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    function FormatT(mx:Integer):String;
    procedure TrayIcon1Click(Sender: TObject);
    procedure BeepMe;
  private
  public
   var lm, m, s, hx, mx, acp, tht, widOrg, heigOrg,i,cj: integer;
   var cadena,fileTarea,midir,dirtrab,dirdbf1,dirdbf2,dirdbf3: String;
   var n3, ln: TextFile;
   var PosOrgForm, PosCursor, PosOrgCursor: TPoint;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.BeepMe;
var sb, Rruta:string;
begin
  {$IFDEF WINDOWS}
        sndPlaySound('rin.wav', snd_Async or snd_NoDefault);
  {$ENDIF}
   {$IFDEF UNIX}
      midir:=SysUtils.GetEnvironmentVariable('USER');
      dirtrab:='/home/'+midir+'/.cronotas/';
      Rruta:=dirtrab+'rin.wav';
      runcommand('mplayer', [Rruta],sb);
  {$ENDIF}
end;
function TForm1.FormatT(mx:Integer):String;
begin
   if mx<10 then
      FormatT:= '0'+IntToStr(mx)
   else
      FormatT:= IntToStr(mx);
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
    Form1.WindowState := wsNormal;
    Form1.ShowInTaskBar := stDefault;
    Form1.Show;
end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
begin
  if not DataModule1.DataSource1.DataSet.FieldByName('nota').IsNull then begin
    DataModule1.DataSource1.DataSet.Next;
    form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
    Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then begin
      DBDateEdit1.ReadOnly:=true;
      Memo1.ReadOnly:=true
    end
    else begin
      DBDateEdit1.ReadOnly:=false;
      Memo1.ReadOnly:=false;
    end;
  end;
end;

procedure TForm1.SpeedButton7Click(Sender: TObject);
begin
  if not DataModule1.DataSource1.DataSet.FieldByName('nota').IsNull then begin
    DataModule1.DataSource1.DataSet.Prior;
    form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
    Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then begin
      DBDateEdit1.ReadOnly:=true;
      Memo1.ReadOnly:=true
    end
    else begin
      DBDateEdit1.ReadOnly:=false;
      Memo1.ReadOnly:=false;
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  MyDbf: TDbf;
  MyDbf2: TDbf;
  MyDbf3: TDbf;
begin
  i:=0;
  hx:=0;
  mx:=0;
  acp:=0;
  tht:=0;
  lm:=1;
  i:=0;
 {$IFDEF WINDOWS}
    midir:=SysUtils.GetEnvironmentVariable('appdata');
    dirtrab:=midir+'\cronotas';
    dirdbf1:=dirtrab+'\notas.dbf';
    dirdbf2:=dirtrab+'\jornada.dbf';
    dirdbf3:=dirtrab+'\config.dbf';
 {$ENDIF}
  {$IFDEF UNIX}
    midir:=SysUtils.GetEnvironmentVariable('USER');
    dirtrab:='/home/'+midir+'/.cronotas/';
    dirdbf1:=dirtrab+'notas.dbf';
    dirdbf2:=dirtrab+'jornada.dbf';
    dirdbf3:=dirtrab+'config.dbf';
 {$ENDIF}
  if not DirectoryExists(dirtrab) then begin
    CreateDir(dirtrab);
  end;
  MyDbf := TDbf.Create(nil);
  MyDbf2 := TDbf.Create(nil);
  MyDbf3 := TDbf.Create(nil);
  try
    if not FileExists(dirdbf1) then begin
      MyDbf.FilePath := dirtrab;
      MyDbf.TableLevel := 7;
      MyDbf.Exclusive := True;
      MyDbf.TableName := 'notas.dbf';
      With MyDbf.FieldDefs do begin
        Add('id', ftInteger);
        Add('fecha', ftDate);
        Add('nombre', ftString, 100, True);
        Add('nota', ftmemo);
        Add('proteger', ftboolean);
        Add('completar',ftboolean);
        Add('color', ftString,50, True);
        Add('pcolor', ftString,50, True);
      End;
        MyDbf.CreateTable;
        MyDbf.Open;
        MyDbf.AddIndex('id', 'id', [ixPrimary, ixUnique]);
        MyDbf.Close;
    end;
    if not FileExists(dirdbf2) then begin
      MyDbf2.FilePath := dirtrab;
      MyDbf2.TableLevel := 7;
      MyDbf2.Exclusive := True;
      MyDbf2.TableName := 'jornada.dbf';
      With MyDbf2.FieldDefs do begin
        Add('id', ftInteger);
        Add('fecha', ftDate);
        Add('hx', ftInteger);
        Add('mx', ftInteger);
        Add('horas', ftString,9, True);
      End;
        MyDbf2.CreateTable;
        MyDbf2.Open;
        MyDbf2.AddIndex('id', 'id', [ixPrimary, ixUnique]);
        MyDbf2.Close;
    end;
    if not FileExists(dirdbf3) then begin
      MyDbf3.FilePath := dirtrab;
      MyDbf3.TableLevel := 7;
      MyDbf3.Exclusive := True;
      MyDbf3.TableName := 'config.dbf';
      With MyDbf3.FieldDefs do begin
        Add('id', ftInteger);
        Add('ruta', ftString,100, True);
      End;
        MyDbf3.CreateTable;
        MyDbf3.Open;
        MyDbf3.AddIndex('id', 'id', [ixPrimary, ixUnique]);
        MyDbf3.Close;
    end;
  finally
    MyDbf.Free;
    MyDbf2.Free;
    MyDbf3.Free;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  relativeRut: string;
begin
  if not DataModule1.dbf3.Active then begin
    DataModule1.dbf3.FilePath:=dirtrab;
    DataModule1.dbf3.Open;
    DataModule1.DataSource3.Enabled:=true;
    DataModule1.DataSource3.AutoEdit:=true;
    if DataModule1.DataSource3.DataSet.RecordCount =0 then begin
       DataModule1.DataSource3.DataSet.Insert;
       DataModule1.DataSource3.DataSet.FieldValues['id']:= 0;
       DataModule1.DataSource3.DataSet.FieldValues['ruta']:=dirtrab;
       DataModule1.DataSource3.DataSet.Post;
    end;
  end;
  {$IFDEF WINDOWS}
     relativeRut:=DataModule1.DataSource3.DataSet.FieldValues['ruta']+'\notas.dbf';
  {$ENDIF}
  {$IFDEF UNIX}
     relativeRut:=DataModule1.DataSource3.DataSet.FieldValues['ruta']+'notas.dbf';
  {$ENDIF}
  if not DataModule1.dbf1.Active then begin
    if FileExists(relativeRut) then
        DataModule1.dbf1.FilePath:=DataModule1.DataSource3.DataSet.FieldValues['ruta']
    else
        DataModule1.dbf1.FilePath:=dirtrab;
    DataModule1.dbf1.Open;
    DataModule1.DataSource1.Enabled:=true;
    DataModule1.DataSource1.AutoEdit:=true;
    if DataModule1.DataSource1.DataSet.RecordCount = 0 then
       MenuItem5.Click;
    MenuItem17.Click;
  end;
  Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
  panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
  Form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
  if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then begin
    Memo1.ReadOnly:=true;
  end
  else begin
      Memo1.ReadOnly:=false;
  end;
  Memo1.SelStart:=0;
  Memo1.SetFocus;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  Form1.WindowState := wsMinimized;
  Form1.Hide;
  Form1.ShowInTaskBar := stNever;
end;

procedure TForm1.Image7MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
    PosOrgForm.X := Left;
    PosOrgForm.Y := Top;
    PosOrgCursor.x := mouse.CursorPos.x  ;
    PosOrgCursor.y := mouse.CursorPos.y  ;
    widOrg:=Width;
    heigOrg:=Height;
    While ( Mouse.Capture <> 0) do
      begin
        poscursor.x := mouse.CursorPos.x;
        poscursor.y := mouse.cursorpos.y;
        Width := widOrg + PosCursor.X-PosOrgCursor.x;
        Height := heigOrg+ poscursor.y-PosOrgCursor.y;
        Application.processmessages;
      end;
end;

procedure TForm1.Image9Click(Sender: TObject);
begin
  if not MenuItem10.Checked then begin
    MenuItem10.Click;
    MenuItem10.Checked:=true;
  end
  else begin
     MenuItem10.Click;
     MenuItem10.Checked:=false;
  end;
end;

procedure TForm1.BtJornadaClick(Sender: TObject);
begin
  PopupMenu2.PopUp;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  if CheckTrabajo.Checked then
     MenuItem4.Click
  else
     MenuItem3.Click;
end;

procedure TForm1.Label3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lm:=StrToInt(label2.Caption);
  if lm < 59 then
     lm:=lm+1;
  label2.Caption:=IntToStr(lm);
end;

procedure TForm1.Label4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  lm:=StrToInt(label2.Caption);
  if lm > 1 then
    lm:=lm-1;
  label2.Caption:=IntToStr(lm);
end;

procedure TForm1.Label6Click(Sender: TObject);
begin
  if CheckCrono.Checked then
    MenuItem1.Click
  else
    MenuItem2.Click;
end;

procedure TForm1.Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label6.Hint:='Cronometro en: '+label2.Caption + 'Min';
end;

procedure TForm1.MCamarilloClick(Sender: TObject);
begin
     memo1.Color:=$00B0FFFF;
     Form1.color:=$00B0FFFF;
     panel2.Color:=$0080FFFF;
     DataModule1.DataSource1.DataSet.Edit;
     DataModule1.DataSource1.DataSet.FieldValues['color']:='$00B0FFFF';
     DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$0080FFFF';
end;

procedure TForm1.MCazulClick(Sender: TObject);
begin
     memo1.Color:=$00FFE9D2;
     Form1.color:=$00FFE9D2;
     panel2.Color:=$00FFCE9D;
     DataModule1.DataSource1.DataSet.Edit;
     DataModule1.DataSource1.DataSet.FieldValues['color']:='$00FFE9D2';
     DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$00FFCE9D';
end;

procedure TForm1.MCblancoClick(Sender: TObject);
begin
     memo1.Color:=$00F7F7F7;
     Form1.color:=$00F7F7F7;
     panel2.Color:=$00E0E0E0;
     DataModule1.DataSource1.DataSet.Edit;
     DataModule1.DataSource1.DataSet.FieldValues['color']:='$00F7F7F7';
     DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$00E0E0E0';
end;

procedure TForm1.MCDefaultClick(Sender: TObject);
begin
      memo1.Color:=$00D2D6E0;
      Form1.color:=$00D2D6E0;
      panel2.Color:=$00A3ABC0;
      DataModule1.DataSource1.DataSet.Edit;
      DataModule1.DataSource1.DataSet.FieldValues['color']:='$00D2D6E0';
      DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$00A3ABC0';
end;

procedure TForm1.MCrosaClick(Sender: TObject);
begin
     memo1.Color:=$00DDCCFF;
     Form1.color:=$00DDCCFF;
     panel2.Color:=$00CBB3FF;
     DataModule1.DataSource1.DataSet.Edit;
     DataModule1.DataSource1.DataSet.FieldValues['color']:='$00DDCCFF';
     DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$00CBB3FF';
end;

procedure TForm1.MCverdeClick(Sender: TObject);
begin
     memo1.Color:=$00CCFFCC;
     Form1.color:=$00CCFFCC;
     panel2.Color:=$0093FF93;
     DataModule1.DataSource1.DataSet.Edit;
     DataModule1.DataSource1.DataSet.FieldValues['color']:='$00CCFFCC';
     DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$0093FF93';
end;

procedure TForm1.MenuItem10Click(Sender: TObject);
begin
   if MenuItem10.Checked then begin
     DataModule1.Dbf1.Filter:='DTOS(FECHA)='+'"'+ FormatDateTime('yyyy',date) +FormatDateTime('mm',date) +FormatDateTime('dd',date) +'"';
     DataModule1.Dbf1.Filtered:=true;
     MenuItem10.Checked:=true;
     if not DataModule1.DataSource1.DataSet.FieldByName('nota').IsNull then begin
       panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
       Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
       Form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
       if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then begin
         Memo1.ReadOnly:=true;
       end
       else begin
           Memo1.ReadOnly:=false;
       end;
     end
     else begin
           memo1.ReadOnly:=true;
           memo1.Lines.Add('Sin Resultados....');
           memo1.Color:=clSilver;
           form1.Color:=clSilver;
           DBDateEdit1.ReadOnly:=true;
           MenuItem5.Enabled:=false;
           MenuItem6.Enabled:=false;
           MenuItem7.Enabled:=false;
           MenuItem17.Enabled:=false;
           MenuItem18.Enabled:=false;
     end;
   end
   ELSE begin
     DataModule1.Dbf1.Filtered:=false;
     DataModule1.DataSource1.DataSet.First;
     panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
     Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
     Form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
     MenuItem5.Enabled:=true;
     MenuItem6.Enabled:=true;
     MenuItem7.Enabled:=true;
     MenuItem17.Enabled:=true;
     MenuItem18.Enabled:=true;
     if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then begin
       Memo1.ReadOnly:=true;
       DBDateEdit1.ReadOnly:=true;
     end
     else begin
         Memo1.ReadOnly:=false;
         DBDateEdit1.ReadOnly:=false;
     end;
   end;
end;

procedure TForm1.MenuItem14Click(Sender: TObject);
begin
  Clipboard.AsText:=memo1.SelText;
end;

procedure TForm1.MenuItem15Click(Sender: TObject);
begin
  DataModule1.DataSource1.DataSet.Edit;
  memo1.Lines.Add(Clipboard.AsText.Trim);
end;

procedure TForm1.MenuItem17Click(Sender: TObject);
begin
    i:=0;
    DataModule1.dbf1.Filtered:=false;
    DataModule1.Dbf1.Filter:='DTOS(FECHA)='+'"'+ FormatDateTime('yyyy',date) +FormatDateTime('mm',date) +FormatDateTime('dd',date) +'"';
    DataModule1.dbf1.Filtered:=true;
    while not DataModule1.dbf1.EOF do
    begin
       i:=i+1;
       DataModule1.dbf1.next;
    end;
    if i >0 then begin
       image9.Hint:='Hoy ('+inttostr(i)+')'+' Notas';
       image9.Visible:=true;
       BeepMe;
       TrayIcon1.BalloonHint:='Tienes Hoy ('+inttostr(i)+')'+' Notas Pendientes';
       TrayIcon1.ShowBalloonHint;
    end
    else
       image9.Visible:=false;
    MenuItem9.Checked:=false;
    DataModule1.Dbf1.Filtered:=false;
    DataModule1.DataSource1.DataSet.First;
    form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
    Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then
      Memo1.ReadOnly:=true
    else
      Memo1.ReadOnly:=false;
    MenuItem10.Checked:=false;
end;

procedure TForm1.MenuItem18Click(Sender: TObject);
  var Reply, BoxStyle: Integer;
  var txt: String;
begin
  i:=0;
  txt:= 'Eliminar la Nota: '+ DataModule1.DataSource1.DataSet.FieldByName('nombre').Text;
  BoxStyle := MB_ICONQUESTION + MB_YESNO;
  Reply := Application.MessageBox(pchar(txt),'Enviar a Papelera', BoxStyle);
  if Reply = IDYES then begin
    DataModule1.DataSource1.DataSet.Delete;
    DataModule1.DataSource1.AutoEdit:=false;
    DataModule1.DataSource1.Enabled:=false;
    DataModule1.dbf1.Close;
    DataModule1.dbf1.Exclusive:=true;
    DataModule1.dbf1.Open;
    DataModule1.dbf1.PackTable;
    DataModule1.dbf1.RegenerateIndexes;
    DataModule1.dbf1.Close;
    DataModule1.dbf1.Exclusive:=false;
    DataModule1.dbf1.Open;
    DataModule1.DataSource1.AutoEdit:=true;
    DataModule1.DataSource1.Enabled:=true;
    DataModule1.Dbf1.Filter:='DTOS(FECHA)='+'"'+ FormatDateTime('yyyy',date) +FormatDateTime('mm',date) +FormatDateTime('dd',date) +'"';
    DataModule1.dbf1.Filtered:=true;
    while not DataModule1.dbf1.EOF do
    begin
      i:=i+1;
      DataModule1.dbf1.next;
    end;
    image9.Hint:='Hoy ('+inttostr(i)+')'+' Notas';
    if i >0 then
       image9.Visible:=true
    else
       image9.Visible:=false;
    if MenuItem10.Checked = false then
        DataModule1.dbf1.Filtered:=false;
    DataModule1.DataSource1.DataSet.First;
    form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
    Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
    if DataModule1.DataSource1.DataSet.FieldValues['proteger'] = true then
      Memo1.ReadOnly:=true
    else
      Memo1.ReadOnly:=false;
  end;
end;

procedure TForm1.MenuItem1Click(Sender: TObject);
begin
  m:=0;
  s:=0;
  Timer1.Interval:=1000;
  Timer1.Enabled:=True;
  label3.Visible:=false;
  label4.Visible:=false;
  CheckCrono.Checked:=false;
end;

procedure TForm1.MenuItem21Click(Sender: TObject);
begin
  DataModule1.DataSource1.DataSet.Edit;
  DataModule1.DataSource1.DataSet.FieldValues['nota']:='';
  DataModule1.DataSource1.DataSet.Post;
end;

procedure TForm1.MenuItem22Click(Sender: TObject);
begin
  if MenuItem22.Checked then
    FormStyle:=fsSystemStayOnTop
  else
    FormStyle:=fsNormal;
end;

procedure TForm1.MenuItem23Click(Sender: TObject);
begin
  Formconfig.ShowModal;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  Timer1.Enabled:=False;
  m:=0;
  s:=0;
  label3.Visible:=true;
  label4.Visible:=true;
  label6.Caption:= '00:00';
  CheckCrono.Checked:=true;
end;

procedure TForm1.MenuItem30Click(Sender: TObject);
begin
  MenuItem3.Click;
  DataModule1.Dbf1.Close;
  DataModule1.dbf3.Close;
  close;
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  Timer2.Enabled:=false;
  label1.Caption:='-- : -- Ht';
  CheckTrabajo.Checked:=true;
  DataModule1.dbf2.Close;
  DataModule1.DataSource2.Enabled:=false;
  DataModule1.DataSource2.AutoEdit:=false;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
var
  relativeRut: string;
begin
  {$IFDEF WINDOWS}
      relativeRut:=DataModule1.DataSource3.DataSet.FieldValues['ruta']+'\jornada.dbf';
   {$ENDIF}
   {$IFDEF UNIX}
      relativeRut:=DataModule1.DataSource3.DataSet.FieldValues['ruta']+'jornada.dbf';
   {$ENDIF}
  if not DataModule1.dbf2.Active then begin
    cj:=0;
    if FileExists(relativeRut) then
        DataModule1.dbf2.FilePath:=DataModule1.DataSource3.DataSet.FieldValues['ruta']
    else
        DataModule1.dbf2.FilePath:=dirtrab;
    DataModule1.dbf2.Open;
    DataModule1.DataSource2.Enabled:=true;
    DataModule1.DataSource2.AutoEdit:=true;
    DataModule1.Dbf2.Filter:='DTOS(FECHA)='+'"'+ FormatDateTime('yyyy',date) +FormatDateTime('mm',date) +FormatDateTime('dd',date) +'"';
    DataModule1.dbf2.Filtered:=true;
    while not DataModule1.dbf2.EOF do
    begin
      cj:=cj+1;
      DataModule1.dbf2.next;
    end;
    if cj > 0 then begin
      hx:= DataModule1.DataSource2.DataSet.FieldValues['hx'];
      mx:= DataModule1.DataSource2.DataSet.FieldValues['mx'];
    end
    else begin
      DataModule1.DataSource2.DataSet.Insert;
      DataModule1.DataSource2.DataSet.FieldValues['id']:=DataModule1.DataSource2.DataSet.RecordCount+1;
      DataModule1.DataSource2.DataSet.FieldValues['fecha']:=FormatDateTime('dd',date)+'/'+FormatDateTime('mm',date)+'/'+FormatDateTime('yyyy',date);
      DataModule1.DataSource2.DataSet.FieldValues['hx']:=0;
      DataModule1.DataSource2.DataSet.FieldValues['mx']:=0;
      DataModule1.DataSource2.DataSet.FieldValues['horas']:='00:00 Ht';
      DataModule1.DataSource2.DataSet.Post;
    end;
  end;
  Timer2.Interval:=1000;
  Timer2.Enabled:=true;
  label1.Caption:='00:00 Ht';
  CheckTrabajo.Checked:=false;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin
     DataModule1.DataSource1.DataSet.Insert;
     DataModule1.DataSource1.DataSet.FieldValues['id']:=DataModule1.DataSource1.DataSet.RecordCount+1;
     DataModule1.DataSource1.DataSet.FieldValues['nombre']:='Nota'+ IntToStr(DataModule1.DataSource1.DataSet.RecordCount+1);
     DataModule1.DataSource1.DataSet.FieldValues['proteger']:=false;
     DataModule1.DataSource1.DataSet.FieldValues['completar']:=false;
     DataModule1.DataSource1.DataSet.FieldValues['nota']:='';
     DataModule1.DataSource1.DataSet.FieldValues['color']:='$00B0FFFF';
     DataModule1.DataSource1.DataSet.FieldValues['pcolor']:='$0080FFFF';
     DataModule1.DataSource1.DataSet.Post;
     DataModule1.DataSource1.DataSet.Last;
     Memo1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
     panel2.Color:=DataModule1.DataSource1.DataSet.FieldValues['pcolor'];
     Form1.Color:=DataModule1.DataSource1.DataSet.FieldValues['color'];
end;

procedure TForm1.MenuItem6Click(Sender: TObject);
begin
  MenuItem22.Checked:=false;
  FormStyle:=fsNormal;
  Form3.ShowModal
end;

procedure TForm1.MenuItem7Click(Sender: TObject);
begin
  if DataModule1.DataSource1.DataSet.FieldValues['proteger']=true then begin
    DataModule1.DataSource1.DataSet.Edit;
    DataModule1.DataSource1.DataSet.FieldValues['proteger']:=false;
    DataModule1.DataSource1.DataSet.Post;
  end
  else begin
    DataModule1.DataSource1.DataSet.Edit;
    DataModule1.DataSource1.DataSet.FieldValues['proteger']:=true;
    DataModule1.DataSource1.DataSet.Post;
  end;
end;

procedure TForm1.MenuItem9Click(Sender: TObject);
begin
  MenuItem4.Click;
  MenuItem3.Click;
  MenuItem22.Checked:=false;
  FormStyle:=fsNormal;
  if form2.ShowModal= mrOK then  begin
    DataModule1.dbf2.Close;
  end;
end;

procedure TForm1.Panel1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  PosOrgForm.X := Left;
    PosOrgForm.Y := Top;
    PosOrgCursor.x := mouse.CursorPos.x  ;
    PosOrgCursor.y := mouse.CursorPos.y  ;
    While ( mouse.Capture <> 0) do
      begin
        poscursor.x := mouse.CursorPos.x;
        poscursor.y := mouse.cursorpos.y;
        Left := PosOrgForm.X - PosOrgCursor.X + PosCursor.X;
        Top := PosOrgForm.Y - PosOrgCursor.Y + PosCursor.Y;
        Application.processmessages;
      end;
end;

procedure TForm1.pcolorPopup(Sender: TObject);
begin
  if DataModule1.DataSource1.DataSet.FieldValues['proteger']=true then begin
    MenuItem15.Enabled:=false;
    MenuItem21.Enabled:=false;
    MCamarillo.Enabled:=false;
    MCazul.Enabled:=false;
    MCrosa.Enabled:=false;
    MCblanco.Enabled:=false;
    MCDefault.Enabled:=false;
    MCverde.Enabled:=false;
  end
  else begin
      MenuItem14.Enabled:=true;
      MenuItem15.Enabled:=true;
      MenuItem21.Enabled:=true;
      MCamarillo.Enabled:=true;
      MCazul.Enabled:=true;
      MCrosa.Enabled:=true;
      MCblanco.Enabled:=true;
      MCDefault.Enabled:=true;
      MCverde.Enabled:=true;
  end;
  if DataModule1.DataSource1.DataSet.FieldByName('nota').IsNull then begin
    MenuItem14.Enabled:=false;
    MenuItem15.Enabled:=false;
    MenuItem21.Enabled:=false;
    MCamarillo.Enabled:=false;
    MCazul.Enabled:=false;
    MCrosa.Enabled:=false;
    MCblanco.Enabled:=false;
    MCDefault.Enabled:=false;
    MCverde.Enabled:=false;
  end;
end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
begin
  if DataModule1.DataSource1.DataSet.FieldValues['proteger']=true then  begin
     MenuItem7.Checked:=true;
     MenuItem6.Enabled:=false;
     MenuItem18.Enabled:=false;
  end
  else begin
     MenuItem7.Checked:=false;
     MenuItem6.Enabled:=true;
     MenuItem18.Enabled:=true;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  s:= s+1;
  m:= m+1;
  if s = 60 then
     s:=0;
  if m = 3600 then
     m:=0;
  cadena := FormatT(m div 60)+':'+FormatT(s);
  label6.Caption:=cadena;
  if m = (StrToInt(Label2.Caption)*60) then
    begin
      if MenuItem28.Checked then
         BeepMe;
      s:=0;
      m:=0;
      label6.Caption:= '00:00';
      CheckCrono.Checked:=true;
      label3.Visible:=true;
      label4.Visible:=true;
      Timer1.Enabled:=False;
      TrayIcon1.BalloonHint:='Tiempo Completado..';
      TrayIcon1.ShowBalloonHint;
      if MenuItem29.Checked then
           ShowMessage('Tiempo Completado..');
    end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  tht:=tht+1;
  hx:=hx+1;
  mx:=mx+1;
  if tht=60 then begin
    DataModule1.DataSource2.DataSet.Edit;
    DataModule1.DataSource2.DataSet.FieldValues['hx']:=hx;
    DataModule1.DataSource2.DataSet.FieldValues['mx']:=mx;
    DataModule1.DataSource2.DataSet.FieldValues['horas']:=FormatT(hx div 3600)+ ':'+FormatT(mx div 60)+' Ht';
    DataModule1.DataSource2.DataSet.Post;
    tht:=0;
  end;
  if mx = 3600 then
     mx:=0;
  Label1.Caption:=FormatT(hx div 3600)+ ':'+FormatT(mx div 60)+' Ht';
end;

end.

