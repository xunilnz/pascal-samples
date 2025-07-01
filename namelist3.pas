program NameList3;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes, Crt;

type
  TPerson = record
    Name: string[20];
    Age: Integer;
    Gender: string[10];
    Height: string[10];
  end;

type
  TNames = class
    names: array of TPerson;
    count: integer;
    procedure initial;
    procedure sort;
    procedure insert;
    procedure add;
    procedure delete;
    procedure displayNames;
    procedure savedata;
    procedure loaddata;
  end;

procedure TNames.initial;
begin
  SetLength(names, 6);
  with names[1] do begin Name := 'Tom'; Age := 34; Gender := 'Male'; Height := '5,5"'; end;
  with names[2] do begin Name := 'Pauline'; Age := 35; Gender := 'Female'; Height := '5,2"'; end;
  with names[3] do begin Name := 'Aaron'; Age := 45; Gender := 'Male'; Height := '4,9"'; end;
  with names[4] do begin Name := 'Jane'; Age := 46; Gender := 'Female'; Height := '5,11"'; end;
  with names[5] do begin Name := 'John'; Age := 25; Gender := 'Male'; Height := '6,1"'; end;

  count := 6;
end;

procedure TNames.sort;
var
  innercount, outercount: integer;
  temp: TPerson;
begin
  for outercount := 1 to count - 2 do
  begin
    for innercount := outercount + 1 to count - 1 do
    begin
      if UpperCase(names[outercount].Name) > UpperCase(names[innercount].Name) then
      begin
        temp := names[outercount];
        names[outercount] := names[innercount];
        names[innercount] := temp;
      end;
    end;
  end;
end;

procedure TNames.insert;
var
  i, x: integer;
  s: TPerson;
begin
  write('Please enter position number to insert person: ');
  readln(i);
  if (i < 1) or (i > count) then
  begin
    writeln('Invalid position!');
    exit;
  end;

  write('Please enter the persons name: ');
  readln(s.Name);
  write('Please enter the persons age: ');
  readln(s.Age);
  write('Please enter the persons gender: ');
  readln(s.Gender);
  write('Please enter the persons height: ');
  readln(s.Height);

  count := count + 1;
  SetLength(names, count);
  
  for x := count - 1 downto i do
    names[x] := names[x - 1];

  names[i] := s;
end;

procedure TNames.add;
var
  s: TPerson;
begin
  write('Please enter the name you wish to add: ');
  readln(s.Name);
  write('Please enter their age: ');
  readln(s.Age);
  write('Please enter their gender: ');
  readln(s.Gender);
  write('Please enter their height: ');
  readln(s.Height);

  count := count + 1;
  SetLength(names, count);
  names[count - 1] := s;
  writeln(s.Name, ' now added to list');
end;

procedure TNames.delete;
var
  i, x: integer;
begin
  write('Which item do you wish to remove from the list? Please enter number: ');
  readln(i);
  if (i < 1) or (i >= count) then
  begin
    writeln('Invalid item number!');
    exit;
  end;

  for x := i to count - 2 do
    names[x] := names[x + 1];

  count := count - 1;
  SetLength(names, count);
end;

procedure TNames.displayNames;
var
  x: integer;
begin
  ClrScr;
  if count = 0 then
  begin
    writeln('No records to display.');
    exit;
  end;
  
  for x := 1 to count - 1 do
    writeln(x, ' - ', names[x].Name, ' Age: ', names[x].Age, ' Gender: ', names[x].Gender, ' Height: ', names[x].Height);
end;

procedure TNames.savedata;
var
  f: file of TPerson;
  I: Integer;
begin
  AssignFile(f, 'person.dat');
  try
    Rewrite(f);
    for I := 1 to count - 1 do
      Write(f, names[I]);
    writeln('Data saved successfully.');
  except
    on E: Exception do
      writeln('Error saving data: ', E.Message);
  end;
  CloseFile(f);
end;

procedure TNames.loaddata;
var
  f: file of TPerson;
  temp: TPerson;
begin
  AssignFile(f, 'person.dat');
  try
    Reset(f);
    count := 1;
    SetLength(names, 1); // Start with empty array
    
    while not Eof(f) do
    begin
      Read(f, temp);
      count := count + 1;
      SetLength(names, count);
      names[count - 1] := temp;
    end;
    
    if count > 1 then
      writeln('Data loaded successfully.')
    else
      writeln('No data found in file.');
  except
    on E: Exception do
      writeln('Error loading data: ', E.Message);
  end;
  CloseFile(f);
end;

var
  Names1: TNames;
  Selection: char;

begin
  Names1 := TNames.Create;
  Names1.initial;
  if FileExists('person.dat') then
    Names1.loaddata
  else
    writeln('No existing data file found. Starting with default data.');

  repeat
    writeln;
    writeln('Pascal Contact Diary. What would you like to do?');
    writeln('1 - Display list...');
    writeln('2 - Sort the list...');
    writeln('3 - Insert a new person...');
    writeln('4 - Add a new person...');
    writeln('5 - Delete a person from the list...');
    writeln('6 - Save changes...');
    writeln('7 - Load person data details...');
    writeln('x - exit the program...');
    write('Please enter your selection: ');
    readln(Selection);

    case Selection of
      '1': Names1.displayNames;
      '2': begin
             Names1.sort;
             Names1.displayNames;
           end;
      '3': begin
             Names1.insert;
             Names1.displayNames;
           end;
      '4': begin
             Names1.add;
             Names1.displayNames;
           end;
      '5': begin
             Names1.delete;
             Names1.displayNames;
           end;
      '6': Names1.savedata;
      '7': Names1.loaddata;
      'x': // do nothing
      else
        writeln('Invalid entry!');
    end;
  until (Selection = 'x') or (Selection = 'X');

  Names1.Free;
end.
