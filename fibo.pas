program fibo;

function Fibo(number: integer): integer;
var i, previous, next, res: integer;
begin
    if number <= 0 then
        Fibo := 0
    else
    begin
        next := 0;
        res := 1;
        for i := 2 to number do
        begin
            previous := next;
            next := res;
            res := previous + next;
        end;

        Fibo := res;
    end;
end;

begin
    writeln(Fibo(7));
end.