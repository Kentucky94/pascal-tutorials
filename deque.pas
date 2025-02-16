program deque_test;

type
    NodePtr = ^Node;
    Node = record
        value: longint;
        prev, next: NodePtr;
    end;
    Deque = record
        first: NodePtr;
        last: NodePtr;
    end;

procedure DequeInit(var d: Deque);
begin
    d.first := nil;
    d.last := nil;
end;

procedure DequePushLeft(var d: Deque; n: longint);
var tmp: NodePtr;
begin
    new(tmp);
    tmp^.value := n;
    
    if d.first = nil then
    begin
        d.first := tmp;
        d.last := tmp;
    end
    else
    begin
        tmp^.next := d.first;
        d.first^.prev := tmp;
        d.first := tmp;
    end;
end;

procedure DequePushRight(var d: Deque; n: longint);
var tmp: NodePtr;
begin
    new(tmp);
    tmp^.value := n;

    if d.first = nil then
    begin
        d.first := tmp;
        d.last := tmp;
    end
    // will not happen
    // else if (d.first <> nil) and (d.last = nil) then
    // begin
    //     tmp^.prev := d.first;
    //     d.first^.next := tmp;
    //     d.last := tmp;
    // end
    else
    begin
        tmp^.prev := d.last;
        d.last^.next := tmp;
        d.last := tmp;
    end;
end;

procedure DequePopLeft(var d: Deque; var b: longint);
var 
    tmp: NodePtr;
begin
    tmp := d.first;

    if (tmp <> nil) then
    begin
        b := tmp^.value;

        if (d.first^.next <> nil) then
            d.first^.next^.prev := nil;

        dispose(tmp)
    end;
end;

procedure DequePopRight(var d: Deque; var b: longint);
var
    tmp: NodePtr;
begin
    tmp := d.last;

    if (tmp <> nil) then
    begin
        if (d.last^.prev <> nil) then
            d.last^.prev^.next := nil;

        dispose(tmp);
    end;
end;

procedure DequePrint(var d: Deque);
var tmp: NodePtr;
begin
    tmp := d.first;

    while tmp <> nil do
    begin
        writeln(tmp^.value);
        tmp := tmp^.next;
    end;
end;

var
    buffer: longint;
    current: Deque;
begin
    // DequePushRight(current, 1);
    // DequePushRight(current, 2);
    // DequePushRight(current, 3);
    // DequePushRight(current, 4);

    // DequePushLeft(current, 1);
    // DequePushLeft(current, 2);
    // DequePushLeft(current, 3);
    // DequePushLeft(current, 4);

    DequePushLeft(current, 1);
    DequePushLeft(current, 2);
    DequePushRight(current, 3);
    DequePushRight(current, 4);
    DequePopLeft(current, buffer);
    DequePopRight(current, buffer);

    DequePrint(current);
end.