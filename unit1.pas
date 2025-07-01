unit Unit1;

{$mode objfpc} {$H+}

interface

uses
  Classes,SysUtils;
 
type
  THelloWorld = class
   public
    procedure WriteOut;
	private
   end;

implementation

procedure THelloWorld.WriteOut;
begin
 Writeln('Hello, World!');
end;

end.
