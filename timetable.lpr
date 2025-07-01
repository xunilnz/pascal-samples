program timetable;

{$mode objfpc}{$H+}

uses
  SysUtils, Classes, Math, DateUtils;

type
  TArrivalTime=class
    distance:double;
    milepermin:double;
    avgspeed:double;
    timetaken:Int64;
    starttime:TDateTime;
    endtime: TDateTime;

    function calculateTime():TDateTime;
end;

function TArrivalTime.calculateTime(): TDateTime;
begin
  milepermin:= (avgspeed /60.00); // get miles per minute
  timetaken:=round(distance / milepermin); // in minutes roundup
  endtime:= IncMinute(starttime,timetaken);
  writeln;
  writeln('You arrival time will be at: '+TimeToStr(endtime));
end;

var
  ArrivalTime:TArrivalTime;
  dis:Integer;
  sTime:string;

begin
  ArrivalTime:=TArrivalTime.create;

  write('Please enter start tim of journey? eg HH:mm');
  readln(sTime);
  ArrivalTime.starttime:=StrToTime(sTime);
  write('Please enter distance of journey in miles: ');
  readln(dis);
  ArrivalTime.distance:=dis;
  ArrivalTime.avgspeed:=60;
  ArrivalTime.calculateTime;
  ArrivalTime.Free;
end.

