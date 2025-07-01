program Trig;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes;

type
  TTrig = class
    float : single;
	hyp : single;

	function getres(): single;
  end;

function TTrig.getres: single;
begin
  hyp:=100;
  // The cosine of 60 degrees = 0.5
  float:= Cos(PI/3) * hyp; // = 180/6 = 60 degrees
  getres:=float;
end;

var
  Trig1: TTrig;

begin
	Trig1:=TTrig.create;
	Trig1.getres;
	Writeln('cos(60) * hyp = '+ FloatToStr(Trig1.float));
	Trig1.free;
end.

