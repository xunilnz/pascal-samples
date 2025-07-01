program StringLoop;
{$mode objfpc}{$H+}

Const
S = 'Hello,How,Are,You,Today';

Var
C: Char;

begin
    for C in S do
        write(c+'');

    writeln;
end.