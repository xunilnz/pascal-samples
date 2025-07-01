program repeatLoop;
{$mode objfpc}{$H+}

uses
    Classes, crt;

var
    i: integer;
    count: integer;

begin
    clrscr;
    count:=1;
    write('Which multiplication would you like to display? : ');
    readln(i);
    repeat
        writeln(count,'x',i,'=',(i*count));
        count := count+1;
    until count > 22;
end.
