program person;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes;

type
  TPerson = record
            Name: string;
            Age: Integer;
            Gender: string;
            Height: string;
  end;

var
  person1:TPerson;

begin
  write('Please enter your name: ');
  readln(person1.Name);
  write('Please enter your age: ');
  readln(person1.Age);
  write('Please enter your gender: ');
  readln(person1.Gender);
  write('Please enter your height: ');
  readln(person1.Height);

  writeln;
  Writeln('Hi '+person1.Name+', are the details we have on you correct?');
  writeln('You are '+IntToStr(person1.Age)+' years of age');
  writeln('Your gender is '+person1.Gender);
  writeln('Your height is '+person1.Height);
  writeln;
  write('Are these details correct? ');
  readln;
end.