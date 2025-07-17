unit helloworld;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,message;

type

  { TfrmHello }

  TfrmHello = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Test(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private

  public

  end;

var
  frmHello: TfrmHello;

implementation

{$R *.lfm}

{ TfrmHello }

procedure TfrmHello.Test(Sender: TObject);
begin
  frmMessage.Show;
end;

procedure TfrmHello.Edit1Change(Sender: TObject);
begin
  label1.Caption := edit1.Text;
end;

end.

