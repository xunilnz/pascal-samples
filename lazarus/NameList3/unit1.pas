unit Unit1;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Grids, CRT, LCLType,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StringGrid1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frmInit;
    function IsDataCheckOk:Integer;
    procedure StringGrid1Click(Sender: TObject);
  private

  public

  end;

type
  TPerson = record
    Name:string[20];
    Age:Integer;
    Gender:string[10];
    Height:string[10];
  end;

type
  TNames=class
    names : array of TPerson;
    count: integer;
    procedure initial;
    procedure sort;
    procedure insert;
    procedure add;
    procedure delete;
    procedure displayNames;
    procedure savedata;
    procedure loaddata;
  end;

var
  Form1: TForm1;
  Names1:TNames;
  Selection:Char;
  idx:integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  Edit3.Text := '';
  Edit4.Text := '';
  label8.caption := '';
  Names1:=TNames.Create;
  Names1.Initial;
  Names1.displayNames;
end;

procedure TForm1.frmInit;
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Label8.Caption:='';
  Names1.displayNames;
  idx:=0;
end;

function TForm1.IsDataCheckOk : Integer;
var
  flg : Integer;
begin
  flg := 0;
  if (Form1.Edit1.Text='') or (Form1.Edit2.Text = '') or (Form1.Edit3.Text = '') or (Form1.Edit4.Text = '') then
     ShowMessage('Please enter all information')
  else
      flg:=1;

  IsDataCheckOk:=flg;
end;

procedure TForm1.StringGrid1Click(Sender: TObject);
begin
  Label8.Caption:=IntToStr(StringGrid1.Row);
  idx:=StringGrid1.Row;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Names1.savedata;
  ShowMessage('Successfully Saved');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Names1.loaddata;
  frmInit;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Names1.Free; // Remember to releases resources
  Form1.Close;
end;

procedure TForm1.Button1Click(Sender: TObject); // Sort Button
begin
  Names1.sort;
  frmInit;
end;

procedure TForm1.Button2Click(Sender: TObject); // Insert Button
begin
  if Form1.IsDataCheckOk = 0 then exit;
  if idx=0 then
     begin
       ShowMessage('Please Select a position to insert Entry');
       exit;
     end;
  Names1.insert;
  idx:=0;
  Label8.Caption := '';
  frmInit;
end;

procedure TForm1.Button3Click(Sender: TObject); // Add Button
begin
  if Form1.IsDataCheckOk = 0 then exit;
  Names1.add;
  frmInit;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Names1.delete;
  frmInit;
end;

procedure TNames.initial; // Set default names
begin
  SetLength(names,6);
  with names[1] do begin Name:='Tom'; Age:=34; Gender:='Male'; Height:='5,5"'; end;
  with names[2] do begin Name:='Pauline'; Age:=35; Gender:='Female'; Height:='5,2"'; end;
  with names[3] do begin Name:='Aaron'; Age:=45; Gender:='Male'; Height:='4,9"'; end;
  with names[4] do begin Name:='Jane'; Age:=46; Gender:='Female'; Height:='5,11"'; end;
  with names[5] do begin Name:='John'; Age:=25; Gender:='Male'; Height:='6,1"'; end;

  count:=6
end;

procedure TNames.sort;
var
  innercount,outercount: integer;
  begin
    for outercount := 1 to count-1 do
    begin
      for innercount := outercount+1 to count-1 do
      begin
        if UpperCase(LeftStr(names[outercount].Name,1)) > UpperCase(LeftStr(names[innercount].Name,1))
        then
        begin
          names[0].Name:=names[outercount].Name;names[0].Age:=names[outercount].Age;
          names[0].Gender:=names[outercount].Gender;names[0].Height:=names[outercount].Height;
          names[outercount].Name:=names[innercount].Name;
          names[outercount].Age:=names[innercount].Age;
          names[outercount].Gender:=names[innercount].Gender;
          names[outercount].Height:=names[innercount].Height;
          names[innercount].Name:=names[0].Name;names[innercount].Age:=names[0].Age;
          names[innercount].Gender:=names[0].Gender;names[innercount].Height:=names[0].Height;
        end;
      end;
    end;
  end;


procedure TNames.insert; // Insert a new entry at specified location
var
  x:integer;
begin
  count := count+1;
  SetLength(names,count+1); // resize array

  for x:=count downto idx do
  begin
    names[x].Name:=names[x-1].Name;
    names[x].Age:=names[x-1].Age;
    names[x].Height:=names[x-1].Height;
    names[x].Gender:=names[x-1].Gender;
  end;

  names[idx].Name:=Form1.Edit1.Text;
  names[idx].Age:=StrToInt(Form1.Edit2.Text);
  names[idx].Gender:=Form1.Edit3.Text;
  names[idx].Height:=Form1.Edit4.Text;

  ShowMessage(Form1.Edit1.Text+' Person now inserted into list');

end;

procedure TNames.add;
begin
  count:=count+1;
  SetLength(names,count); // resize array

  names[count-1].Name:=Form1.Edit1.Text;
  names[count-1].Age:=StrToInt(Form1.Edit2.Text);
  names[count-1].Gender:=Form1.Edit3.Text;
  names[count-1].Height:=Form1.Edit4.Text;

  ShowMessage(Form1.Edit1.Text+' added to list');
end;

procedure TNames.delete;
var
  Reply,BoxStyle: integer;
  x:integer;
begin
  BoxStyle:=MB_ICONQUESTION + MB_YESNO;
  Reply := Application.MessageBox('Are you sure?','Delete Name',BoxStyle);
  if Reply <> IDYES then Exit;

  for x:=idx to count-1 do
  begin
    names[x].Name:=names[x+1].Name;
    names[x].Age:=names[x+1].Age;
    names[x].Gender:=names[x+1].Gender;
    names[x].Height:=names[x+1].Height;
  end;
  count := count-1;
  SetLength(names,count); // resize array
end;

procedure TNames.displayNames;
var
  i: Integer;

begin
  Form1.StringGrid1.RowCount:=Names1.count;
  Form1.StringGrid1.Cells[0,0]:='Index';
  Form1.StringGrid1.Cells[1,0]:='Name';
  Form1.StringGrid1.Cells[2,0]:='Age';
  Form1.StringGrid1.Cells[3,0]:='Gender';
  Form1.StringGrid1.Cells[4,0]:='Height';

  for i:=1 to Names1.count do
  begin
    with Form1.StringGrid1 do
     begin
      cells[0,i]:=IntToStr(i);
      cells[1,i]:=names[i].Name;
      cells[2,i]:=IntToStr(names[i].Age);
      cells[3,i]:=names[i].Gender;
      cells[4,i]:=names[i].Height;
     end;
  end;
end;

procedure TNames.savedata;
var
  f : file of TPerson;
  I : Integer;
  myFile: string;

begin
  if Form1.SaveDialog1.Execute then
     myFile:=Form1.SaveDialog1.FileName;

  names[0].Age := count; // Store count

  {$I-}
  AssignFile(f, myFile);
  Rewrite(f);
  {$I+}

  try
    for I:=0 to count do
      BlockWrite(f,names[i], SizeOf(names[I]));
  finally
    CloseFile(f);
  end;
end;

procedure TNames.loaddata;
var
  f: file of TPerson;
  I: integer;
  myFile: String;

begin
  if Form1.OpenDialog1.Execute then
     myFile:=Form1.OpenDialog1.FileName;
  I:=1;
  FillChar(names,sizeof(names), #0);
  SetLength(names,count+1);

  {$I-}
  AssignFile(f,myFile);
  Reset(f); // Open the file for read
  {$I+}

  try
    BlockRead(f,names[0],SizeOf(names[0]));
    count := names[0].Age; // Retrieve Count
    SetLength(names,count+1);

    while not eof(f) do
    begin
      BlockRead(f,names[I],SizeOf(names[I]));
      count:=I;
      I:=I+1;
    end;
  finally
    CloseFile(f);
  end;
  Form1.Label5.Caption:= 'Current file: '+myFile;
end;

Begin //This begin is not needed, but if you need to perform functions first it can go here.
end.

