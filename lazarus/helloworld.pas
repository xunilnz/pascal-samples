unit helloworld;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmHello }

  TfrmHello = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  frmHello: TfrmHello;

implementation

{$R *.lfm}

{ TfrmHello }

procedure TfrmHello.Button1Click(Sender: TObject);
begin
  ShowMessage('Hello, World!');
end;

end.

