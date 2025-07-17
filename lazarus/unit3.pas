unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Unit2, Unit4;

type

  { TForm3 }

  TForm3 = class(TForm2)
    ToggleBox1: TToggleBox;
    procedure ToggleBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

{ TForm3 }

procedure TForm3.ToggleBox1Click(Sender: TObject);
begin
  if ToggleBox1.Checked then Form4.Top:=10;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 //inherited;
 ShowMessage('Another msg from '+(Sender as TButton).Caption);
end;

end.

