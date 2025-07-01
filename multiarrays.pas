program MultiArrays;
{$mode objfpc}{$H+}

uses
  SysUtils, Classes;

var
  // Define dynamic array
  multiArray : Array of Array of byte; // Multi-dimension array
  i,j: Integer;

begin
  // Set the length of the 1st dimension of the multi-dimension array
  SetLength(multiArray,3);

  // Set the length of the 3 sub-arrahs to different sizes
  for i:=0 to 2 do
  begin
    SetLength(multiArray[i], 1);
    SetLength(multiArray[i], 2);
    SetLength(multiArray[i], 3);
  end;

  // Set and show all elelments of this array
  for i := 0 to High(multiArray) do
   for j := 0 to High(multiArray[i]) do
    begin
      multiArray[i,j] := i+j;
      writeln('multiArray['+IntToStr(i)+','+IntToStr(j)+'] = '+IntToStr(multiArray[i,j]));
    end;
end.