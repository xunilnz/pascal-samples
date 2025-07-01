{ This is a multi-line comment.
	it is ignored by the Pascal Compiler }

// Single line comment

(* This is also a multi line comment.
	it too is ignored by the
	pascal compiler *)
program SimpleObjectPascalProgram;
{$mode objfpc}{$H+} // these are compiler directives and not ignored by the compiler.

type
  THelloWorld = class
  	procedure WriteOut;
  end;

 procedure THelloWorld.Writeout;
   begin
     Writeln('Hello, World!');
   end;

var
  HelloWorld : THelloWorld;

begin
 HelloWorld := THelloWorld.Create;
 // constructor returns a pointer to an object of type THelloWorld
 HelloWorld.WriteOut;
 HelloWorld.Free; { this line deallocates the THelloWorld object pointed to by HelloWorld }
end.

