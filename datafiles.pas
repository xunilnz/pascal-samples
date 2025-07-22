// Compile time errors - Compile, Debug, Compile
program DataFiles;

type
    StudentRecord = Record
      s_name: String;
      s_addr: string;
      s_batchcode: String;
    end;

var
    Student: StudenRecord;
    f: file of StudentRecord;

begin
    Assign(f,'students.dat');
    Rewrite(f);
    Student.s_name := 'John Smith';
    Student.s_addr := 'Invercargill, New Zealand';
    Student.s_batchcode := 'Computer Science's';

    write(f,Student);
    close(f);
end.
