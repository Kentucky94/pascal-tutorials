program drawRumb;
var 
    width: integer = 7;
    height, left, right, x, y: integer;

begin
    height := width;

    for x := 1 to height do
    begin
        left := (left) div 2;

        for y := 1 to width do
        begin
            //1 = width - 1 / 2
            //2 = width -3 / 2

            write((y < width / 2) or (y > width / 2));
        end;

        writeln;
    end;
end.