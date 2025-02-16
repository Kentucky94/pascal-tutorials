program filter_ok;
var 
    c: char;
    line_count: longint;
    is_new_line: boolean;

begin
    line_count := 0;

    while not eof do
    begin
        read(c);

        if c = #10 then
        begin
            writeln('Ok ', line_count, ' symbols in line');
            line_count := 0;
            continue;
        end;

        line_count := line_count + 1;
    end;

    writeln('Bye')
end.