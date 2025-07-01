program MySet;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes;

type
  days = (mon, tue, wed, thu, fri, sat, sun);
  dow = set of days;

procedure displayDow(d : dow);
const
names: array [days] of string[12]
 = ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday');

var
  dl : days;
  s : string;

begin
  s:='';
  for dl:=mon to sun do
    if dl in d then
    begin
      if (s<>'') then s:=s+',';
      s:=s+names[dl];
    end;

  writeln('[',s,']');
end;

var
  d:dow;

begin
  d:=[mon,tue,wed,thu,fri,sat,sun];
  displayDow(d);

  d:=[sun,thu,wed]+[fri,mon];
  displayDow(d);
end.
