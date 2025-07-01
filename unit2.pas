Unit Unit2;

{$mode objfpc}{$H+}

interface

Uses
 SysUtils, Classes;

type
  TAlcatrazBBS = class
  public
    procedure WriteOut;
    private
  end;

implementation

procedure TAlcatrazBBS.WriteOut;
begin
  Writeln('Welcome to Alcatraz Inmate');
end;
end.

