program roomTemp;
{$mode objfpc}{$H+}

uses
  Classes;

var
  temp: double;
  ans: char;

begin
  write('What is the current current room temperature? : ');
  readln(temp);

  if (temp >=32) then
  begin
    write('Would you like to turn the temperature down? :');
    readln(ans);

    if (ans = 'Y') or (ans = 'y') then
     writeln('Turning down temperature.')
     else
     writeln('Not adjusting temperature');
  end;
  if (temp < 20) then
  begin
    write('Would you like to turn the temperature up? :');
    readln(ans);
    if (ans = 'Y') or (ans = 'y') then
        writeln('Turning up temperature')
       else
        writeln('Not adjusting temperature');
  end;
end.