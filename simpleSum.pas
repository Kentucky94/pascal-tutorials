program simple_sum;
type 
    ColorType = (red, orange);
var 
    sum, count, n: longint;
    color: ColorType;

begin
    sum := 0;
    count := 0;
    color := orange;

    while not SeekEof do
    begin
        read(n);
        sum := sum + n;
        count := count + 1;
    end;

    writeln(count, ' ', sum, ' ', color, ' ', succ(color));
end.