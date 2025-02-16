program contstants; 
const
    message = 'Hello, world';
    count = 20;
var
    i:integer;

begin
    for i := 1 to count do
    begin
        writeln(message, i);
    end;
end.