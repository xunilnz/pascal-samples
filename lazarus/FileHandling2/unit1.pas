unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);

begin

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  TotalBytesRead, BytesRead : Int64;
  Buffer : array[0..4095] of byte; // or, array[0..4095] of char
  fs : TFileStream;
  myUTF8String : UTF8String;
  mySize : Integer;

begin
  try
    fs:=TfileStream.Create('mydata.txt',fmOpenRead or fmShareDenyWrite);
    fs.Position := 0;
    TotalBytesRead := 0;
    mySize := fs.Size;
    while TotalBytesRead < fs.Size do
    begin
      BytesRead := fs.Read(Buffer,sizeof(Buffer));
      inc(TotalBytesRead,BytesRead);
    end;
  finally
    fs.free;
  end;
  setlength(myUTF8String,mySize);
  move(Buffer[0],myUTF8String[1],mySize);
  memo1.text := myUTF8String;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  fs : TFileStream;

begin
  fs:=TFileStream.Create('mydata.txt',fmCreate or fmOpenWrite);
  try
    fs.Write(PChar(memo1.text)^,length(memo1.text));
    //fs.Write(memo1.Text,Length(memo1.text));
  finally
    fs.Free;
  end;
end;

end.

