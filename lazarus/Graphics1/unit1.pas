unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  x: Integer;
begin
  Canvas.Pen.color:=clred;
  canvas.Line(0,0,Form1.Width,Form1.Height);
  Canvas.Pen.color:=clgreen;
  canvas.Line(0,Form1.Height,Form1.Width,0);
  Canvas.Pen.Color:=clPurple;

   for x:=100 to 105 do
     Canvas.Line(x,50,x+250,200);

   Canvas.Pen.Color:=clBlue;
   Canvas.Line(100,150,350,200);
end;

end.

