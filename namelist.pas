program NameList;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes;

type
   TNames=class
      names : array of string;
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
  names[1]:='Sarah';
  names[2]:='Kim';
  names[3]:='Asher';
  names[4]:='Koda';
  names[5]:='Haysen';
  count:=6;
end;

procedure TNames.sort; // arrange the list in alphapetical order ascending - first character
 var
  innercount,outercount:integer;
 begin
   for outercount:=1 to count-1 do
   begin
     for innercount := outercount +1 to count-1 do
     begin
       if UpperCase(LeftStr(names[outercount],1)) > UpperCase(LeftStr(names[innercount],1)) then
       begin
         names[0]:= names[outercount];
         names[outercount]:= names[innercount];
         names[innercount] := names[0];
       end;
     end;
   end;
end;

procedure TNames.insert; // insert a new entry at the specified location
  var
   i,x: integer;
   s: string;
   begin
     count:= count+1;
     SetLength(names,count+1); // resize the array
     write('Please enter position number to insert name: ');
     readln(i);
     write('Now please enter name: ');
     readln(s);

     for x:= count downto i do
     names[x]:=names[x-1];
     names[i]:=s;
     writeln(s+ ' now inserted into list');
   end;

procedure TNames.add;
  var
    s:string;

begin
  write('Please enter the name you wish to add: ');
  readln(s);
  count:=count+1;
  SetLength(names,count); // resize to array
  names[count-1]:=s;
  writeln(s+ ' now added to list');
end;

procedure TNames.delete;
  var
    i,x:integer;

  begin
    write('Which item do you wish to delete from list? Please enter number: ');
    readln(i);
    for x:=i to count-1 do
    names[x]:=names[x+1];

    SetLength(names,count); // resize to array
    count:=count-1;
   end;

procedure TNames.displayNames;
var
 x: integer;

begin
  for x:=1 to count-1 do
  writeln(x,' - ',names[x]);
end;

var
  Names1:TNames;
  Selection: char;

begin
  Names1:= TNames.Create;
  Names1.initial;

  repeat
    writeln;
    Writeln('Pascal Contact Diary, What would you like to do?');
    writeln('1 - Display list...');
    writeln('2 - Sort the list...');
    writeln('3 - Insert a new name...');
    writeln('4 - Add a new name...');
    writeln('5 - Delete a name from the list...');
    writeln('x - Exit the program...');
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
    writeln('Invalid Option');
    end;
    if (selection <> '1') and (Selection <> 'x') and (Selection <> 'X') then
     Names1.displayNames;
   until (Selection = 'x') or (Selection = 'X');
     Names1.free;
end.
