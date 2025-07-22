unit ListView1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ComCtrls;

type
  TListView1 = class(TListView)
  private

  protected

  public

  published

  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional',[TListView1]);
end;

end.
