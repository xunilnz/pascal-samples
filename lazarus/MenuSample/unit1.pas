unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    mnSystem: TMenuItem;
    mnHlpContent: TMenuItem;
    mnHlpAbout: TMenuItem;
    mnHelp: TMenuItem;
    mnTimeDate: TMenuItem;
    mnUndo: TMenuItem;
    mnSpace3: TMenuItem;
    mnSelectAll: TMenuItem;
    mnCut: TMenuItem;
    mnCopy: TMenuItem;
    mnPaste: TMenuItem;
    mnDelete: TMenuItem;
    mnspace1: TMenuItem;
    mnFind: TMenuItem;
    mnFindNxt: TMenuItem;
    mnReplace: TMenuItem;
    mnEdit: TMenuItem;
    mnExit: TMenuItem;
    mnSpace: TMenuItem;
    mnOpen: TMenuItem;
    mnSave: TMenuItem;
    mnSaveAs: TMenuItem;
    mnPrint: TMenuItem;
    mnFile: TMenuItem;
    procedure mnExitClick(Sender: TObject);
    procedure mnOpenClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.mnExitClick(Sender: TObject);
begin
  Close; // Close the Application.
end;

procedure TForm1.mnOpenClick(Sender: TObject);
begin
  ShowMessage('Greetings You have just selected the Open... menu option');
end;

end.

