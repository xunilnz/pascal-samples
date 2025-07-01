program NameList2;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes, Crt;

type
  TPerson = record
    Name: string;
    Age: Integer;
    Gender: string;
    Height: string;
  end;


type
  TNames=class
  names : array of TPerson;
  count: integer;
  procedure initial;
  procedure sort;
  procedure insert;
  procedure add;
  procedure delete;
  procedure displayNames;
end;

procedure TNames.initial; // set default names
begin
  SetLength(names,6);
  with names[1] do begin Name:='Tom'; Age:=34; Gender:='Male'; Height:='5,5"'; end;
  with names[2] do begin Name:='Pauline'; Age:=35; Gender:='Female'; Height:='5,2"'; end;
  with names[3] do begin Name:='Aaron'; Age:=45; Gender:='Male'; Height:='4,9"'; end;
  with names[4] do begin Name:='Jane'; Age:=46; Gender:='Female'; Height:='5,11"'; end;
  with names[5] do begin Name:='John'; Age:=25; Gender:='Male'; Height:='6,1"'; end;

  count:=6
  end;

procedure TNames.sort; // arrange the list in alphabetical order ascending - first character
var
  innercount,outercount: integer;
  begin
    for outercount := 1 to count-1 do
    begin
      for innercount := outercount+1 to count-1 do
      begin
        if UpperCase(LeftStr(names[outercount].Name,1)) > UpperCase(LeftStr(names[innercount].Name,1))
        then
        begin
          names[0].Name:=names[outercount].Name;names[0].Age:=names[outercount].Age;
          names[0].Gender:=names[outercount].Gender;names[0].Height:=names[outercount].Height;
          names[outercount].Name:=names[innercount].Name;
          names[outercount].Age:=names[innercount].Age;
          names[outercount].Gender:=names[innercount].Gender;
          names[outercount].Height:=names[innercount].Height;
          names[innercount].Name:=names[0].Name;names[innercount].Age:=names[0].Age;
          names[innercount].Gender:=names[0].Gender;names[innercount].Height:=names[0].Height;
        end;
      end;
    end;
  end;

procedure TNames.insert; // inser a new entry at a specified location
var
  i,x : integer;
  s: TPerson;

begin
  count:= count+1;
  SetLength(names,count+1); // resize array
  write('Please enter position number to insert person: ');
  readln(i);

  write('Please enter the persons name: ');
  readln(s.Name);

  write('Please enter the persons age: ');
  readln(s.Age);

  write('Please enter the persons gender: ');
  readln(s.Gender);

  writeln('Please enter the persons height: ');
  readln(s.Height);

  for x:= count downto i do begin
    names[x].Name:= names[x-1].Name;
    names[x].Age:= names[x-1].Age;
    names[x].Gender:= names[x-1].Gender;
    names[x].Height:= names[x-1].Height;
  end;

  names[i].Name:= s.Name;
  names[i].Age:= s.Age;
  names[i].Gender:= s.Gender;
  names[i].Height:= s.Height;
end;

procedure TNames.add; // add a new entry to the end of the list
var
  s:TPerson;

begin
  write('Please enter the name you wish to add: ');
  readln(s.Name);

  write('Please enter their age: ');
  readln(s.Age);

  write('Please enter their gender: ');
  readln(s.Gender);

  write('Please enter their height: ');
  readln(s.Height);

  count:=count+1;
  SetLength(names,count); // resize array

  names[count-1].Name:=s.Name;
  names[count-1].Age:=s.Age;
  names[count-1].Gender:=s.Gender;
  names[count-1].Height:=s.Height;

  writeln(s.Name+' now added to list');
end;

procedure TNames.delete;
var
  i,x: integer;

begin
  write('Which item do you wish to remove from the list? Please enter number: ');
  readln(i);
  for x:=i to count-1 do begin
        names[x].Name:=names[x+1].Name;
        names[x].Age:=names[x+1].Age;
        names[x].Gender:=names[x+1].Gender;
        names[x].Height:=names[x+1].Height;
  end;

  SetLength(names,count); // resize the array
  count:=count-1;
end;

procedure TNames.displayNames;
var
  x: integer;

begin
    ClrScr;
    for x:=1 to count-1 do
      writeln(x,' - ',names[x].Name,' Age: ',names[x].Age,' Gender: ',names[x].Gender,' Height: ',names[x].Height  );
end;

var
  Names1:TNames;
  Selection:char;

begin
  Names1:=TNames.Create;
  Names1.initial;

  repeat
    writeln;
    writeln('Pascal Contact Diary. What would you like to do?');
    writeln('1 - Display list...');
    writeln('2 - Sort the list...');
    writeln('3 - Insert a new person...');
    writeln('4 - Add a new person...');
    writeln('5 - Delete a person from the list...');
    writeln('x - exit the program...');
    write('Please enter your selection: ');
    readln(Selection);

    case Selection of
      '1': Names1.displayNames;
      '2': Names1.sort;
      '3': Names1.insert;
      '4': Names1.add;
      '5': Names1.delete;
      'x': // do nothing
      else
        writeln('Invalid entry!');
     end;

    if (Selection <> '1') AND (Selection <> 'x') AND (Selection <> 'X') then
    Names1.displayNames;
    until (Selection = 'x') or (Selection = 'X');

    Names1.free;
end.

