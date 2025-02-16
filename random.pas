program random_test;
uses crt;

var
    x, y: integer;
begin
    randomize;
    clrscr;

    while not KeyPressed do
    begin
        x := random(ScreenWidth) + 1;
        y := random(ScreenHeight) + 1;
        if(x = ScreenWidth) and (y = ScreenHeight) then
            continue;
        GotoXY(x, y);
        write('*');
        delay(500);
    end;
    
    write(#27'[0m]');
    clrscr;
end.