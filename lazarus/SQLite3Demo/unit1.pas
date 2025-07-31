unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, DB, Forms, Controls, Graphics, Dialogs,
  DBGrids, StdCtrls, Unit2, Unit3;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Datamodule2.SQLQuery1.Active := false;
  Datamodule2.SQLQuery1.SQL.Text := 'select * from CUSTOMER';
  DataModule2.SQLQuery1.Active := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  DataModule2.SQLQuery1.Active := false;
  DataModule2.SQLQuery1.SQL.Text := 'select * from EMPLOYEE';
  DataModule2.SQLQuery1.Active := true;
end;

end.

