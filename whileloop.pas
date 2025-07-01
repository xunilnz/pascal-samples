program whileLoop;
{$mode objfpc}{$H+}

uses
  Classes;

var i: integer;
    count: integer;

begin
    count:= 1;
    write('Which multiplication would you like to display? ');
    readln(i);
    while count <= 12 do
    begin
        writeln(count,' x ',i,' = ',(i*count));
        count := count +1;
    end;
end.
