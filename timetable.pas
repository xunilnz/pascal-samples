program TimeTable;

{$mode objfpc}{$H+}

uses
    SysUtils, Classes, Math, DateUtils;

 type
    TArrivalTime = class
    distance: double;
    milepermin: double;
    avgspeed: double;
    timetaken: int64;
    starttime: TDateTime;
    endtime: TDateTime;

    function calculateTime(): TDateTime;
 end;

function TArrivalTime.calculateTime(): TDateTime;
begin
    milepermin:= (avgspeed / 60.00); // get miles per minute
    timetaken := round(distance / milepermin); // in minutes rounded up

    endtime := IncMinute(starttime,timetaken);
    writeln;
    writeln('Your arrival time will be at; '+TimeToStr(endtime));
end;

var
    ArrivalTime:TArrivalTime;
    dis:Integer;
    sTime:string;

begin
    ArrivalTime:=TArrivalTime.create;

    write('Please enter start time of journey? eg: HH:mm: ');
    readln(sTime);

    ArrivalTime.starttime:=StrToTime(sTime);

    write('Please enter the distance of the journey in kilometers: ');
    readln(dis);

    ArrivalTime.distance := dis;

    ArrivalTime.avgspeed:=60; // Average speed of the vehicle in Kilometers per hour
    ArrivalTime.calculateTime;
    ArrivalTime.free;
end.

