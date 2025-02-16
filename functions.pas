program functions;
var a: integer;

procedure WriteText(text: string);
begin
    writeln(text);
end;

function IsLatinLetter (ch: char): boolean;
begin
    IsLatinLetter :=
        ((ch >= 'A') and (ch <= 'Z')) or
        ((ch >= 'a') and (ch <= 'z'));
end;

function Cube(text: string; num: integer):integer;
begin
    WriteText(text);
    Cube := num * num * num;
end;

begin
    a := Cube('some text', 10);

    writeln(a);

    if IsLatinLetter('3') then
        writeln('true')
    else
        writeln('false')
end.