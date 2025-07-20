program realDemo(input, output, stderr);

var
	r: real;

begin
	r := 0.0; { r becomes zero }
	writeLn(r, ' ', r:8:4);

	r := 1e2; { r becomes 1*(10^2) [a hundred] }
	writeLn(r, ' ', r:8:4);

        r := r / r; { r becomes one }
        writeLn(r, ' ', r:8:4);
end.
