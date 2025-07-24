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
begin
  Form1.Color:=clSkyBlue;
  Form1.Height:=495;

  Canvas.Pen.Color:=clRed;
  Canvas.Brush.Color:=clYellow;
  Canvas.Rectangle(0,310,Form1.Width,Form1.Height);

  // Utilizing open array construct and point record
  Canvas.Polygon([Point(180,60), Point(180,30), Point(340,380)]);
  Canvas.Polygon([Point(180,60), POint(145,120), Point(120,180), Point(105,240),
  Point(110,300), Point(120,340), Point(145,375), Point(175,380), Point(160,340),
  Point(145,300), Point(140,240), Point(150,180), Point(160,120)]);

  Canvas.Brush.Color:=clRed;
  Canvas.Polygon([Point(80,395), Point(130,420), Point(360,420), Point(380,400)]);

  Canvas.Polygon([Point(180,40), Point(180,60), Point(220,400)]);
  Canvas.Rectangle(180,40,178,420);
end;

end.

