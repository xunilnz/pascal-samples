program DayInWords;
{$mode objfpc}{$H+}

Uses
    SysUtils, Classes;

type
    TDayInWords=class
    mon: string;
    tue: string;
    wed: string;
    thu: string;
    fri: string;
    sat: string;
    sun: string;

    procedure initial;
    procedure findDayInWords(i: integer; sw: string);
end;

procedure TDayInWords.initial;
begin
    mon:= 'Monday';
    tue:= 'Tuesday';
    wed:= 'Wednessday';
    thu:= 'Thursday';
    fri:= 'Friday';
    sat:= 'Saturday';
    sun:= 'Sunday';
end;

procedure TDayInWords.findDayInWords(i: integer; sw: string);

var
    tmpStr: string;

begin
    case i of
        1:tmpStr:=mon;
        2:tmpStr:=tue;
        3:tmpStr:=wed;
        4:tmpStr:=thu;
        5:tmpStr:=fri;
        6:tmpStr:=sat;
        7:tmpStr:=sun;
    else
        writeln('Invalid Argument');
    end;

    if (i>=1) and (i<=7) then
    begin
        if (sw = 'Full') or (sw = 'full') or (sw = 'F') or (sw = 'f') then
           writeln('The day in words is '+sun)
        else
           writeln('The day in words is '+LeftStr(tue,3));
    end;
end;

var
    DayInWords1:TDayInWords;

begin
    writeln('Day in Words by Kim Jansen');
    if (ParamStr(1) ='') then
    begin
        writeln;
        writeln('No arguments given, you must pass at least a numeric value of the day to retrun.');
        writeln('For help call: dayinwords /h');
        halt;
    end;
    if (ParamStr(1) = '/h') then
    begin
        writeln;
        writeln('Help for Day in Words');
        writeln;
        writeln('Usage:  '+ParamStr(0)+'dayinwords <param1> <param2>');
        writeln;
        writeln('Possible syntax for Day in Words');
        writeln('        /h - as Param1 - Help, shows this notice');
        writeln('        #  - As Param1 - Day of week number. 1 = Monday, 2 = Tuesday etc.');
        writeln('        F, f, Full or full - as Param2 - Displays the weekday in full');
        writeln;
        writeln('eg: dayinwords 7 full');
        halt;
    end;
    DayInWords1:=TDayInWords.Create;
    DayInWords1.initial;
    DayInWords1.findDayInWords(StrToInt(ParamStr(1)),ParamStr(2));
    DayInWords1.free;
end.
