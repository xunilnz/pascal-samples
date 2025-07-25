unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  BufDataSet, LCLProc, Grids, XMLDatapacketReader, fpjsondataset, fpJSON,
  JSONParser;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  { private decelerations }
  public
  { public declerations }
  end;

var
  Form1: TForm1;
  buf: TCustomBufDataset;
  //jds: TExtJSJSONDataset;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.Button1Click(Sender: TObject);
var
  rw : Integer;
  cl : integer;

begin
     StringGrid1.Clear;
  try
    buf.loadfromfile('text.xml',dfXML); // load the xml data from disk to memory
    StringGrid1.RowCount := buf.RecordCount+1;
    StringGrid1.ColCount := buf.Fields.Count;

    cl:=1;
    // display the data in the grid
    while not buf.EOF do
    begin
      for rw := 0 to Pred(buf.Fields.Count) do
        StringGrid1.Cells[rw,cl]:=buf.Fields[rw].Text;

      cl:=cl+1;
      buf.Next;
    end;
  finally
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  cl:Integer;
  rw:Integer;

begin
  ShowMessage('TExtJSJSONDataset doesn''t work under Lazarus 4.0/FP 3.2.2');
  // TODO: Figure out the JSON Support
//  jds.LoadFromFile('text1.json');
//  StringGrid1.RowCount:=jds.Rows.Count+1;
//  StringGrid1.Colcount:=jds.MetaDataItems[0].Count;

//  for cl:=0 to Pred(jds.MetaData.Items[0].Count) do
//    StringGrid1.Cells[cl,0]:=TJSONObject(jds.MetaData.Items[0].Items[cl]).Find('attrname').AsString;

//  for rw:=0 to jds.Rows.Count-1 do
//    begin
//      for cl:=0 to jds.MetaData.Items[0].Count-1 do begin
//        StringGrid1.Cells[cl,rw+1]:=jds.Rows.Items[rw].Items[cl].AsString;
//      end;
//    end;

end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  buf:=TCustomBufDataset.Create(nil); // Clear the XML buffer
  StringGrid1.LoadFromCSVFile('text.csv',',',true);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  StringGrid1.SaveToCSVFile('textsave.csv',',',true,false);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //jds:=TEXtJSJSONDataSet.Create(nil);
  buf:=TCustomBufDataset.Create(nil);
end;

end.

