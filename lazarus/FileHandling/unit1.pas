unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtDlgs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    OpenPictureDialog1: TOpenPictureDialog;
    SavePictureDialog1: TSavePictureDialog;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  if SelectDirectoryDialog1.Execute then
    Label1.Caption:=SelectDirectoryDialog1.FileName;
  // Do some work
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if OpenPictureDialog1.Execute then
    Label1.Caption:=OpenPictureDialog1.FileName;
  // Do some work
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    Label1.Caption:=SavePictureDialog1.FileName;
  // Do some work
end;

end.

