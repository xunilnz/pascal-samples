unit message;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TfrmMessage }

  TfrmMessage = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Label1: TLabel;
    Timer1: TTimer;
    procedure Button1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Initial;
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;
Type
  TArrowStar=Record
    ArrowLeftPressed:Boolean;
    ArrowUpPressed:Boolean;
    ArrowRightPressed:Boolean;
    ArrowDownPressed:Boolean;
  end;

var
  frmMessage: TfrmMessage;
  StoredShift: TarrowStar;

implementation

{$R *.lfm}

procedure TFrmMessage.Initial;
begin
  StoredShift.ArrowDownPressed:=False;
  StoredShift.ArrowLeftPressed:=false;
  StoredShift.ArrowRightPressed:=False;
  StoredShift.ArrowUpPressed:=False;
end;

procedure TfrmMessage.Timer1Timer(Sender: TObject);
begin
  If StoredShift.ArrowDownPressed then Label1.Top:=Label1.Top+2;
  If StoredShift.ArrowUpPressed then Label1.Top:=Label1.Top-2;
  If StoredShift.ArrowLeftPressed then Label1.Left:=Label1.Left-2;
  If StoredShift.ArrowRightPressed then Label1.Left:=Label1.Left+2;
end;

procedure TfrmMessage.Button1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Initial;
  StoredShift.ArrowUpPressed:=True;
  Timer1.Enabled:=true;
end;

procedure TfrmMessage.Button1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:=False;
end;

procedure TfrmMessage.Button2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Initial;
  StoredShift.ArrowLeftPressed:=True;
  Timer1.Enabled:=True;
end;

procedure TfrmMessage.Button2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:=False;
end;

procedure TfrmMessage.Button3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Initial;
  StoredShift.ArrowRightPressed:=True;
  Timer1.Enabled:=True;
end;

procedure TfrmMessage.Button3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:=False;
end;

procedure TfrmMessage.Button4MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Initial;
  StoredShift.ArrowDownPressed:=True;
  Timer1.Enabled:=True;
end;

procedure TfrmMessage.Button4MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Timer1.Enabled:=False;
end;

end.

