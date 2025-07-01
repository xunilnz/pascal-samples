(** to calculate c^2 = (a^2+b^2) -2abCod(C)
    let a = adjacent, b= hypontenuse, c = opposite **)
program AnyTrig;
{$mode objfpc}{$H+}

uses
    SysUtils, Classes, Math;

type
    TAnyTrig = class
        part1: single;
        part2: single;
        hyp: single;
        adj: single;
        opp: single;
        res: single;

        function getres(): single;
        function getpart1(): single;
        function getpart2(): single;
    end;

// Calc a^2 + b^2 part
function TAnyTrig.getpart1(): single;
begin
    part1:=power(adj,2) + power(hyp,2);
    getpart1:=part1;
    writeln('result for part1 = '+ FloatToStr(part1));
end;

// Calc 2abCos(C) part
function TAnyTrig.getpart2():single;
var
    cosrad:single;

begin
    cosrad:=Cos(degtorad(37));
    part2:= 2 * adj * hyp * cosrad;
    getpart2:=part2;
    writeln('result for part2 = '+ FloatToStr(part2));
end;

function TAnyTrig.getres: single;
begin
    res := (getpart1 - getpart2);
    res := sqrt(res);
    opp := res;
    getres := opp;
end;

var
    Trig1:TAnyTrig;

begin
    Trig1:=TAnyTrig.Create;
    Trig1.adj:=8;
    Trig1.hyp:=11;

    writeln;
    Writeln('Final result giving length for opposite is = '+FloatToStr(Trig1.getres));
    Trig1.free;
end.
