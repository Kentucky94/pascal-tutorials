program movingstar;
uses crt;

type
    Star = record
        symbol: string;
        CurX, CurY, dx, dy: integer;
    end;

const
    DelayDuration = 100;

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

procedure ShowStar(var s: Star);
begin
    GotoXY(s.CurX, s.CurY);
    write(s.symbol);
    GotoXY(1, 1);
end;

procedure HideStar(var s: Star);
begin
    GotoXY(s.CurX, s.CurY);
    write(' ');
    GotoXY(1, 1);
end;

procedure SetDirection (var s: Star; x, y: integer);
begin
    s.dx := x;
    s.dy := y;
end;

procedure MoveStar (var s: Star);
begin
    HideStar(s);

    s.CurX := s.CurX + s.dx;
    if (s.CurX < 1) then
        s.CurX := ScreenWidth;
    if (s.CurX > ScreenWidth) then
        s.CurX := 1;

    s.CurY := S.CurY + s.dy;
    if (s.CurY < 1) then
        s.CurY := ScreenHeight;
    if (s.CurY > ScreenHeight) then
        s.CurY := 1;

    ShowStar(s)
end;

var
    s: Star;
    c: integer;

begin
    clrscr;
    TextColor(Yellow);
    TextBackground(Blue);
    s.symbol := '*';
    s.CurX := ScreenWidth div 2;
    s.CurY := ScreenHeight div 2;
    s.dx := 0;
    s.dy := 0;
    ShowStar(s);

    while true do
    begin
        if not KeyPressed then
        begin
            MoveStar(s);
            delay(DelayDuration);
            continue;
        end;

        GetKey(c);
        case c of
            32: // space key
                SetDirection(s, 0, 0);
            -75: // arrow left
                SetDirection(s, -1, 0);
            -77: // arrow right
                SetDirection(s, 1, 0);
            -72: // arrow up
                SetDirection(s, 0, -1);
            -80: // arrow down
                SetDirection(s, 0, 1);
            27: break;
        end;
    end;
end.