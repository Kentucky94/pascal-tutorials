program BlockFileCopy;
const
    BufSize = 4096;
var
    src, dest: file;
    buffer: array [1..BufSize] of byte;
    ReadRes, WriteRes: longint;

begin
    {$I-}
    if ParamCount < 2 then
    begin
        writeln(ErrOutput, 'Enter source and destination');
        halt(1);
    end;

    assign(src, ParamStr(1));
    assign(dest, ParamStr(2));
    filemode := 0;
    reset(src, 1); // block size of 1 byte
    if IOResult <> 0 then
    begin
        writeln('Couldn''t open ', ParamStr(1));
        halt(1)
    end;
    filemode := 1;
    rewrite(dest, 1);
    if IOResult <> 0 then
    begin
        writeln('Couldn''t open ', ParamStr(2));
        halt(1);
    end;

    while true do
    begin
        BlockRead(src, buffer, BufSize, ReadRes);
        if ReadRes = 0 then // end of file
            break;

        BlockWrite(dest, buffer, BufSize, WriteRes);

        writeln(ReadRes, ' ', WriteRes);

        if WriteRes <> ReadRes then
        begin
            writeln(ErrOutput, 'Error writing file');
            break;
        end;
    end;

    close(src);
    close(dest);
end.