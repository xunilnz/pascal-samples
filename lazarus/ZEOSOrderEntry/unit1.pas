unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, DBGrids, ZConnection, ZDataset, db;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBLookupComboBox1Change(Sender: TObject);
    procedure DBLookupComboBox2Change(Sender: TObject);
    procedure DBLookupComboBox3Change(Sender: TObject);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure initform;
    procedure loadcmbs;
    procedure loadcmb2;
    procedure loadcmb3;
    procedure dispcustomerinfo(id:integer);
  private
    { Private Declerations }
    dsm: TDataSource;
    qu : TZQuery;
    ds : TDataSource;
    dsord : TDataSource;
    qyord : TZQuery;
    dsprod : TDataSource;
    qyprod : TZQuery;

  public
    { Public Declerations }
    function rs(query:string): TDataSet;
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.rs(query:string): TDataSet;
begin
  qu.SQL.Text:=query;
  dsm.DataSet:=qu;
  qu.Active:=true;
  rs:=dsm.DataSet;
end;

procedure TForm1.dispcustomerinfo(id:integer);
var
  sqltxt:string;
  dscust: TDataSource;
  qycust: TZQuery;

begin
  dscust:=TDatasource.Create(nil);
  qycust:=TZQuery.Create(nil);
  qycust.Connection:=ZConnection1;

  sqltxt:='SELECT * FROM customer WHERE id ='+IntToStr(id);
  qycust.SQL.Text:=sqltxt;
  dscust.DataSet:=qycust;
  qycust.Active:=true;

  with dscust do begin
    Label2.Caption:= dscust.DataSet.FieldByName('id').Text;
    Label4.Caption:= dscust.DataSet.FieldByName('name').Text;
    Label6.Caption:= dscust.DataSet.FieldByName('addr1').Text;
    Label7.Caption:= dscust.DataSet.FieldByName('addr2').Text;
    Label9.Caption:= dscust.DataSet.FieldByName('pc').Text;
    Label11.Caption:= dscust.DataSet.FieldByName('email').Text;
  end;
  dscust.Free;
end;

procedure TForm1.loadcmbs;
begin
  ds.DataSet:=rs('Select id,name From customer');
  DBLookupComboBox1.KeyField:='id';
  DBLookupComboBox1.ListField:='name';
  DBLookupComboBox1.ListSource:=ds;
end;

procedure TForm1.loadcmb2;
var
  sqltxt:string;

begin
  dsord:=TDataSource.Create(nil);
  qyord:=TZQuery.Create(nil);
  qyord.Connection:=ZConnection1;

  sqltxt:='select id,orderref from orderinfo';
  qyord.SQL.Text:=sqltxt;
  dsord.DataSet:=qyord;
  qyord.Active:=true;

  DBLookupComboBox2.KeyField:='id';
  DBLookupComboBox2.ListField:='orderref';
  DBLookupComboBox2.ListSource:=dsord;
end;

procedure TForm1.loadcmb3;
var
   sqltxt:string;

begin
  dsprod:=TDataSource.Create(nil);
  qyprod:=TZQuery.Create(nil);
  qyprod.Connection:=ZConnection1;
  sqltxt:='select * from product';
  qyprod.SQL.Text:=sqltxt;
  dsprod.DataSet:=qyprod;
  qyprod.Active:=true;

  DBLookupComboBox3.KeyField:='id';
  DBLookupComboBox3.ListField:='description';
  DBLookupComboBox3.ListSource:=dsprod;

end;

procedure TForm1.initform;
begin
  dsm:=TDataSource.Create(nil);
  qu:=TZQuery.Create(nil);
  qu.Connection:=ZConnection1;
  ds:=TDataSource.Create(nil);

  loadcmbs;
  loadcmb2;
  loadcmb3;

  // Initialist customer Info Display Fields.
  Label2.Caption:='';
  Label4.Caption:='';
  Label6.Caption:='';
  Label7.Caption:='';
  Label9.Caption:='';
  Label11.Caption:='';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (DBLookupComboBox1.Text='') OR (DBLookupComboBox2.Text='') then
  begin
    ShowMessage('You Must Select a Customer AND order reference to add new items');
   // exit;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin

end;

procedure TForm1.DBLookupComboBox1Change(Sender: TObject);
var
   sqltxt:string;

begin
  sqltxt:='SELECT cu.id,cu.name,ord.orderref,po.orderqty,po.totsellprice as cost,';
  sqltxt:= sqltxt + 'p.code,p.description,p.sellprice as unitcost ';
  sqltxt:= sqltxt + 'FROM product p INNER JOIN (customer cu ';
  sqltxt:= sqltxt + 'INNER JOIN (orderinfo ord INNER JOIN prodordered po ON po.ordid=ord.id) ON ';
  sqltxt:= sqltxt + 'cu.id=ord.custid) ON po.prodid=p.id ';
  sqltxt:= sqltxt + 'WHERE cu.id ='+IntToStr(DBLookupComboBox1.KeyValue);

  ZQuery1.SQL.Text:=sqltxt;
  ZQuery1.Active:=true;

  // Display Customer Details
  dispcustomerinfo(DBLookupComboBox1.KeyValue);

  // Filter order dropdown for orderref selection
  DBLookupComboBox2.Text:='';
  sqltxt:='select id,orderref from orderinfo where custid='+IntToStr(DBLookupComboBox1.KeyValue);
  qyord.SQL.Text:=sqltxt;
  qyord.Active:=true;
end;

procedure TForm1.DBLookupComboBox2Change(Sender: TObject);
begin

end;

procedure TForm1.DBLookupComboBox3Change(Sender: TObject);
begin

end;

procedure TForm1.DBLookupComboBox3Click(Sender: TObject);
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 initform;
end;

end.

