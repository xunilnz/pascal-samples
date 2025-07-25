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
  // TODO: Add CallBack or implement ISStatusNotifier to update Label1 on Form1
    //ShowMessage('Connected')
  else
  // TODO: Add CallBack or implement ISStatusNotifier to update Label1 on Form1
    showMessage('zmSQL Connection Failed');

  zmq:=zmds.DataSet;
end;

end.

