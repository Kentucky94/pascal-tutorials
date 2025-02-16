program records;

type 
    Checkpoint = record
        id: integer;
        latitude, longitude: real;
        is_hidden: boolean;
        penalty: integer;
    end;

var
    c: Checkpoint;

procedure setDataByValue(item: real);
begin
    item := 111.0;

    writeln('result by value ', item);
end;

procedure setDataByLink(var item: real);
begin
    item := 222.0;

    writeln('result by link ', item);
end;

procedure setDataByLink(var item: Checkpoint);
begin
    writeln('id ', item.id);
    writeln('longitude ', item.longitude);
    writeln('latitude ', item.latitude);
    writeln('is hidden ', item.is_hidden);
    writeln('penalty ', item.penalty);
end;

procedure getDataByValue(item: Checkpoint);
begin
    writeln('id ', item.id);
    writeln('longitude ', item.longitude);
    writeln('latitude ', item.latitude);
    writeln('is hidden ', item.is_hidden);
    writeln('penalty ', item.penalty);
end;

procedure getDataByLink(var item: Checkpoint);
begin
    writeln('id ', item.id);
    writeln('longitude ', item.longitude);
    writeln('latitude ', item.latitude);
    writeln('is hidden ', item.is_hidden);
    writeln('penalty ', item.penalty);
end;

begin
    c.id := 123;
    c.longitude := 123;
    c.latitude := 123;
    c.is_hidden := true;
    c.penalty := 21;

    writeln('before');
    getDataByValue(c);
    getDataByLink(c);

    writeln('setting');
    setDataByValue(c.longitude);
    setDataByLink(c.latitude);

    writeln('after');
    getDataByValue(c);
    getDataByLink(c);
end.