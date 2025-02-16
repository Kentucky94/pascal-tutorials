program get_key;
uses crt;

procedure GetKey(var code: integer);
var c: char;
begin
    c := ReadKey;
    if c = #0 then
    begin
        c := ReadKey;
        code := -ord(c);
        exit;
    end;

    code := ord(c);
end;

var i: integer;
begin
    repeat
        GetKey(i);
        writeln(chr(i), ' (', i, ') ');
    until i = 27 // escape key
end.
end;