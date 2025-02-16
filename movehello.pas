program MoveHello;
uses crt;

const message = 'Hello, World!';

procedure GetKey(var code: integer);
var c: char;
begin
    c := ReadKey;
    if c = #0 then
    begin
        c := ReadKey;
        code := -ord(c);
    end
    else
    begin
        code := ord(c);
    end;
end;

procedure ShowMessage(x, y: integer; msg: string);
begin
    GotoXY(x, y);
    write(msg);
    GotoXY(1, 1);
end;

procedure HideMessage(x, y: integer; msg: string);
var len, i: integer;
begin
    len := length(msg);
    GotoXY(x, y);
    for i := 1 to len do
        write(' ');
    GotoXY(1, 1);
end;

procedure MoveMessage(var x, y: integer; msg: string; dx, dy: integer);
begin
    HideMessage(x, y, msg);
    x := x + dx;
    y := y + dy;
    ShowMessage(x, y, msg);
end;

var
    CurX, CurY: integer;
    c: integer;
begin
    clrscr;
    CurX := (ScreenWidth - length(message)) div 2;
    CurY := ScreenHeight div 2;
    ShowMessage(CurX, CurY, message);

    while true do
    begin
        getKey(c);
        if c > 0  then
            break;
        
        case c of
            -75: // arrow left
                begin
                    if (CurX > 1) then
                        MoveMessage(CurX, CurY, message, -1, 0);
                end;
            -77: // arrow right
                begin
                    if ((CurX + length(message) + 1) < ScreenWidth) then
                        MoveMessage(CurX, CurY, message, 1, 0);
                end;
            -72: // arrow up
                begin
                    if (CurY > 1) then
                        MoveMessage(CurX, CurY, message, 0, -1);
                end;
            -80: // arrow down
                begin
                    if(CurY < ScreenHeight) then
                        MoveMessage(CurX, CurY, message, 0, 1);
                end;
        end;
    end;
end.