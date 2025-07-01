// Fucked up. didn't save the file before exiting. thought I had..
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
begin
    if (i < 1) or (i > 7) then
    begin
        writeln('Invalid day integer provided');
    end;
    if (i = 1) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
            writeln('The day in words is '+mon)
        else
            writeln('The day in words is '+LeftStr(mon,3));
    end;
    if (i = 2) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
            writeln('The day in words is '+tue)
        else
            writeln('The day in words is '+LeftStr(tue,3));
    end;
    if (i = 3) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
            writeln('The day in words is '+wed)
        else
            writeln('The day in words is '+LeftStr(wed,3));
    end;
    if (i = 4) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
            writeln('The day in words is '+thu)
        else
            writeln('The day in words is '+LeftStr(thu,3));
    end;
    if (i = 5) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
            writeln('The day in words is '+fri)
        else
            writeln('The day in words is '+LeftStr(fri,3));
    end;
    if (i = 6) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
            writeln('The day in words is '+sat)
        else
            writeln('The day in words is '+LeftStr(sat,3));
    end;
    if (i = 7) then
    begin
        if (sw = 'f') or (sw = 'F') or (sw = 'full') or (sw = 'Full') then
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
