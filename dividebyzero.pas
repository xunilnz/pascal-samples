program DivideByZero;

{$mode objfpc}{$H+}

uses
  Classes,SysUtils;

var
  number1, number0 : Integer;

begin
try
 try
   number0 := 0;
   number1 := 1;

   number1 := number1 div number0;

   writeln('1 / 0 = '+IntToStr(number1));

  except
   on E : exception do
   begin
     Writeln('Exception class name: '+E.ClassName);
     Writeln('Exception Message: '+E.Message);
   end;
 end;

 finally
    begin
        writeln('Number was not assigned a value - using default');
        number1:=0;
    end;
 end;
end.
