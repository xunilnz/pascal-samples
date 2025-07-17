program Inheritance;
{$mode objfpc}{$H+}

type
  Player = Class
  protected
    model : string;
    price: real;

  public
    constructor Create(m: string; p: real); // default constructor
    procedure setmodel(m: string); // sets model for a player
    function getmodel() : String; // retrives the model
    procedure setPrice(p: real); // sets the price for the player
    function getPrice() : real; // retrives the price for a player
    procedure Display(); virtual; // display details of player
  end;

(* Creating a derived class *)
type
 Tape = class(Player)
 private
   manufacturer: String;
 public
   constructor Create(m: String); overload;
   constructor Create(f: String; m: String; p: real); overload;
   procedure setmanufacturer(f: String); // sets the manufacturer for a player
   function getmanufacturer(): string; // retrives the manufacturer
   procedure Display(); override;
 end;

var
  p1,p2: Tape;
  // default constructor
  constructor Player.Create(m: String; p: real);
  begin
    model:=m;
    price:=p;
  end;

  procedure Player.setmodel(m: String); // sets model for a player
  begin
    model:=m;
  end;

  function Player.getmodel() : String; // retrives model
  begin
    getmodel:=model;
  end;

  procedure Player.setPrice(p : real); // sets the price for a player
  begin
    price:=p;
  end;

  function Player.getPrice() : real; // retrives the price
  begin
    getPrice:=price;
  end;

  procedure Player.Display();
  begin
    Writeln('model: ', model);
    Writeln('price: ', price:0:2);
  end;

  (* now the derived class methods *)
  constructor Tape.Create(m: String);
  begin
    inherited Create(m,000.00);
    manufacturer:='';
  end;

  constructor Tape.Create(f: String; m: String; p: real);
  begin
    inherited Create(m,p);
    manufacturer:=f;
  end;

  procedure Tape.setmanufacturer(f: String); // sets manufacturer for a player
  begin
    manufacturer:=f;
  end;

  function Tape.getmanufacturer() : String; // retrives manufacturer
  begin
    getmanufacturer := manufacturer;
  end;

  procedure Tape.Display();
  begin
    Writeln('model: ',model);
    Writeln('price: ',price:0:2);
    Writeln('Manufacturer: ',manufacturer);
  end;

begin
  p1 := Tape.Create('Sony VCR');
  p2 := Tape.Create('Toshiba','DVR20 DVD-VCR',437.78);
  p1.setmanufacturer('Sony');
  p1.setPrice(475.99);
  p1.Display;
  p2.Display;
  p1.Free;
  p2.Free;
end.

