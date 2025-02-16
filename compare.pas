program compare;

var 
    x: integer;
    y: integer;
    z: integer;

begin
    writeln('Choose first number');
    read(x);
    writeln('Choose second number');
    read(y);

    if x > y then
    begin
        z := x;
        x := y;
        y := z;
    end;

    writeln(x, ' ', y);
end.