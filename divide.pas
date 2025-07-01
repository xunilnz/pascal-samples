program Divide;

{$mode objfpc}{$H+}

uses
    SysUtils,Classes;

type
    TDivide = class
    private
        numerator,denominator,result,remainder : Integer;

        procedure calculate;
        procedure displayresult;
    end;

procedure TDivide.calculate;
begin
    result := (numerator div denominator);
end;

procedure TDivide.displayresult;
begin
    writeln('result = '+ inttostr(result));
    writeln('remainter = '+ inttostr(remainder));
end;

var
    Divide1 : TDivide;

begin
    Divide1 := TDivide.Create;
    Divide1.numerator:=78;
    Divide1.denominator:=8;
    Divide1.calculate;
    Divide1.displayresult;
    Divide1.Free;
end.