program variable_params;
var p, q, r, t: real;

// procedure proc(var x: integer; z: integer);
// begin
//     writeln(x);
//     writeln(z);

//     a := 14;

//     x := 18;
// end;

// begin
//     a := 15;

//     proc(a, a);

//     writeln(a);

//     //15
//     //18
// end.

procedure proc(x: real; var quad, cube, fourth, fifth: real);
begin
    quad := x * x;
    cube := quad * x;
    fourth := cube * x;
    fifth := fourth * x;
end;

begin
    proc(17.5, p, q, r, t);

    writeln(p);
    writeln(q);
    writeln(r);
    writeln(t);
end.