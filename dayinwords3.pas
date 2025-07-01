program DayInWords3;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes;

type
  TDayInWords=class
    procedure findDayInWords(i: integer; sw: string);
  end;

procedure TDayInWords.findDayInWords(i: integer; sw: string);
var
  dow: array[1..7] of string = ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

  begin
    if (i >= 1) and (i <= 7) then
    begin
      if UpperCase(sw)=UpperCase('Full') then
        writeln('The day in words is: '+dow[i])
      else
        writeln('The day in words is: '+LeftStr(dow[i],3));
    end
    else
    writeln('Invalid Entry');
  end;

var
  DayInWords1:TDayInWords;

begin
  if(paramStr(1) = '') then
   halt;
  DayInWords1:=TDayInWords.Create;
  DayInWords1.findDayInWords(StrToInt(ParamStr(1)), ParamStr(2));
  DayInWords1.free;
end.
