program PartStr;

{$mode objfpc}{$H+}

uses
	SysUtils,StrUtils,Classes;

const
	TestString = 'Hello How Are You Today';

var
	MyLeftStr: string;
    MyMidStr: string;
    MyRightStr: string;

begin
	// to standard output
    MyLeftStr:= LeftStr(TestString,5);
    MyMidStr:= MidStr(TestString,6,4);
    MyRightStr:= RightStr(TestString,5);

    WriteLn('The start of the string = '+ MyLeftStr);
    WriteLn('The middle of the string = '+ MyMidStr);
    WriteLn('The end of the string = '+ MyRightStr);
end.

