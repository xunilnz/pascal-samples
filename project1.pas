(** The main calling program **)
program Project1;

{$mode objfpc}{$H+}

uses
  Classes,Unit1,Unit2;
  (** You can add more units after this **)

var
 hw: THelloWorld;
 bbs: TAlcatrazBBS;

begin
 hw:=THelloWorld.Create;
 hw.WriteOut;
 hw.Free;
 readln;
 bbs:=TAlcatrazBBS.Create;
 bbs.WriteOut;
 bbs.free;
 readln;
 write('This is the end of the program.');
 writeln(' So it will close now!');
end.

