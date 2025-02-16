program char2num;
var
    s: boolean;
    r: longint;

procedure ReadLongInt(var success: boolean; var result: longint);
var
    c: char;
    res: longint;
    position: integer;
begin
    res := 0;
    position := 0;

    repeat
        read(c);
        position := position + 1;
    until (c <> ' ') and (c <> #10);

    while (c <> ' ') and (c <> #10) do
    begin
        writeln('current symbol is ', c);

        if (c < '0') or (c > '9') then
        begin
            writeln('unexpected ''', c, ''''' in pos: ', position);
            readln;
            success := false;
            exit;
        end;

        res := res*10 + ord(c) - ord('0');
        read(c);
        position := position + 1;
    end;

    result := res;
    success := true;
end;

begin
repeat 
    ReadLongInt(s, r)
until s;

writeln('Result: ', r)    
end.