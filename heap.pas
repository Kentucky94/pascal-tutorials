program heap;

var
    p: ^string;
    s: string;
begin
    new(p);

    p^ := 'This is a string in a heap';
    writeln(p^);

    s := p^;
    dispose(p);
    writeln(s);
end.