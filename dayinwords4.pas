program DayInWords4;

{$mode objfpc}{$H+}

uses
    SysUtils, Classes, StrUtils;

type
    TDayInWords=class
      dow : array of string;
      procedure initial;
      procedure findDayInWords(i:string; sw:string);
    end;

procedure TDayInWords.Initial;
begin
    SetLength(dow,8);

    dow[1] := 'Monday';
    dow[2] := 'Tuesday';
    dow[3] := 'Wednesday';
    dow[4] := 'Thursday';
    dow[5] := 'Friday';
    dow[6] := 'Saturday';
    dow[7] := 'Sunday';
end;

// This procedure will now write Wrong Entry if anything other 1-7 is used!
procedure TDayInWords.FindDayInWords(i:string;sw:string);
var
    s:array[1..7] of string = ('1','2','3','4','5','6','7');
    x:integer;
begin
    x:= AnsiIndexStr(i,s);

if (x >=0 ) then
begin
    x:= StrToInt(i);

    if UpperCase(sw)=UpperCase('Full') then
          writeln('The day in words is: '+dow[x])
        else
          writeln('The day in words is: '+LeftStr(dow[x],3));
    end
     else
        writeln('Wrong Entry');
end;

var
    DayInWords1:TDayInWords;

begin
    //DayInWords1:=TDayInWords.Create; // This line not commented out
    DayInWords1.Initial;
    DayInWords1.findDayInWords(ParamStr(1),ParamStr(2));
    DayInWords1.Free;
end.
