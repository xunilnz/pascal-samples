unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Controls, Graphics, Dialogs, DBCtrls,
  ZMConnection, ZMQueryDataSet, db;

type
   zmconnectiom = class(TObject)
   public
     function zmq(query: string; fldr:string; tbl:string): TDataSet;
   private
     zmc: TZMConnection;
     zmqu: ZMQueryDataSet.TZMQueryDataSet;
     zmds: TDataSource;
end;

implementation

function zmconnectiom.zmq(query: string; fldr:string; tbl:string): TDataSet;
begin
  zmc:=TZMConnection.Create(nil);
  zmqu:=ZMQueryDataSet.TZMQueryDataSet.Create(nil);
  zmds:=TDataSource.Create(nil);

  zmqu.ZMConnection:=zmc;
  zmqu.SQL.Text:=query;
  zmqu.QueryExecute;
  zmds.DataSet:=zmqu;

  if zmc.Connected then
    //ShowMessage('Connected')
    //label1.caption:='Connected'
  else
    //label1.caption:='Not Connected');
    showMessage('zmSQL Connection Failed');

  zmq:=zmds.DataSet;
end;

end.

