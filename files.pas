program files;
const
    filename = 'test.txt';
    data = 'thit sis sparta';

var
    t: text;
begin
    {$I-}
    assign(t, filename);
    rewrite(t);
    if IOResult <> 0 then
    begin
        writeln('Could''nt open file ', filename);
        halt(1);
    end;

    write(t, data);
    if IOResult <> 0 then
    begin
        writeln('Could''nt write data to file ', filename);
        halt(1);
    end;
    close(t);
end.

// var
//     t: text;
//     s: string;
// begin
//     {$I-}
//     assign(t, filename);
//     reset(t);
//     if IOResult <> 0 then
//     begin
//         writeln('Could''nt open file ', filename);
//         halt(1);
//     end;
//     while not SeekEOF(t) do
//     begin
//         readln(t, s);
//         writeln(s);
//     end;
//     close(t);
// end.