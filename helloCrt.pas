program helloCrt;
uses crt;
const 
    Message = 'Hello, World!';
    DelayDuration = 5000;
var
    x, y: integer;
begin
    clrscr;
    x := (ScreenWidth - length(Message)) div 2;
    y := ScreenHeight div 2;
    GotoXY(x, y);
    write('Hello world');
    GotoXY(1, 1);
    delay(DelayDuration);
    clrscr;
end.