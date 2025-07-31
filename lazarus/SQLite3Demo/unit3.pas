unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, SQLDB;

type

  { TDataModule2 }

  TDataModule2 = class(TDataModule)
    DataSource1: TDataSource;
    SQLQuery1: TSQLQuery;
  private

  public

  end;

var
  DataModule2: TDataModule2;

implementation

{$R *.lfm}

end.

