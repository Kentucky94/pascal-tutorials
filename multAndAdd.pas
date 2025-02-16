program mult_and_add;

const
    filename = 'test.txt';

var
    f: text;
    num, sum, mul: real;
begin
    {$I-}
    assign(f, filename);
    reset(f);
    if IOResult <> 0 then
    begin
        writeln('Could not open file ', filename);
        halt(1)
    end;
    
    sum := 0;
    while not SeekEOF(f) do
    begin
        mul := 1;

        while not SeekEoln(f) do
        begin
            read(f, num);
            mul := mul * num;
        end;

        readln(f); // to remove line break
        sum := sum + mul;
    end;

    close(f);
    writeln(sum:7:5)
end.