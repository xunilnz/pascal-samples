unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, FileUtil, Controls, Graphics, Dialogs, StdCtrls,
  DBGrids, DBCtrls, db, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure showResult(sqltxt:string; fldr:string; fl:string);

    private
      { Private declerations }
      p2 : zmconnectiom;
      ds2 : TDataSource;
    public
      { Public declerations }
end;


var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  memo1.text:='';
  p2:=zmconnectiom.Create;
  ds2:=TDataSource.Create(nil);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (memo1.text='') then begin
    ShowMessage('Please enter an SQL script and table name');
    exit;
  end;
  showResult(memo1.Text,'dummy','dummy');
end;

procedure TForm1.showResult(sqltxt:string; fldr:string; fl:string);
begin
  ds2.DataSet:=p2.zmq(sqltxt,fldr,fl);
  DBGrid1.DataSource:=ds2;
  DBGrid1.AutoFillColumns:=true;
end;


end.

