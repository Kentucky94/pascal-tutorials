program add_nums_to_list;

type 
    ItemPtr = ^Item;
    Item = record
        value: longint;
        next: ItemPtr;
    end;
    List = record
        first: ItemPtr;
        last: ItemPtr;
        length: integer;
    end;

procedure InitList(var l: List);
begin
    l.first := nil;
    l.last := nil;
    l.length := 0;
end;

procedure AddToList(var l: List; n: longint);
var temp: ItemPtr;
begin
    new(temp);
    temp^.value := n;

    if (l.first = nil) then
    begin
        l.first := temp;
        l.last := temp;
        l.length := 1;
        exit;
    end;

    l.last^.next := temp;
    l.last := temp;
    l.length := l.length + 1;
end;

procedure AddToSortedList(var l: List; n: longint);
var 
    temp: ItemPtr;
    pointer_to_pointer: ^ItemPtr;
begin
    pointer_to_pointer := @(l.first);

    while (pointer_to_pointer^ <> nil) and (pointer_to_pointer^^.value < n) do
    begin
        pointer_to_pointer := @(pointer_to_pointer^^.next);
    end;

    new(temp);
    temp^.value := n;
    temp^.next := pointer_to_pointer^;
    pointer_to_pointer^ := temp;
end;

procedure AddNumToSortedList(var i: ItemPtr; n: longint);
var temp: ItemPtr;
begin
    if (i = nil) or (i^.value > n) then
    begin
        new(temp);
        temp^.value := n;
        temp^.next := i;
        i := temp;
    end
    else
        AddNumToSortedList(i^.next, n);
end;

procedure AddToSortedListRecursive(var l: List; n: longint);
begin
    AddNumToSortedList(l.first, n);
end;

procedure ShowEls(var l: List);
var temp: ItemPtr;
begin
    writeln('start');
    temp := l.first;

    while temp <> nil do
    begin
        writeln(temp^.value);
        temp := temp^.next;
    end;
end;

procedure SortList (var l: List);
var
    i: integer;
    pointer_to_pointer: ^ItemPtr;
    currentTemp, nextTemp, last: ItemPtr;
begin
    for i := 1 to l.length do
    begin
        currentTemp := nil;
        nextTemp := nil;
        last := nil;
        pointer_to_pointer := @(l.first); // address to address to first
        // pointer_to_pointer^ - address to first
        // pointer_to_pointer^^ - first
        // pointer_to_pointer^^.next = address to next
        // @(pointer_to_pointer^^.next) - address to address to next

        while (pointer_to_pointer^ <> nil) and (pointer_to_pointer^^.next <> nil) do
        begin
            if (pointer_to_pointer^^.value > pointer_to_pointer^^.next^.value) then
            begin
                currentTemp := pointer_to_pointer^;
                nextTemp := currentTemp^.next;
                last := nextTemp^.next;

                pointer_to_pointer^ := nextTemp;
                pointer_to_pointer^^.next := currentTemp;
                pointer_to_pointer^^.next^.next := last;
            end
            else
                pointer_to_pointer := @(pointer_to_pointer^^.next);
        end;
    end;
end;

function SumList (var i: ItemPtr): longint;
begin
    if (i = nil) then
    begin
        SumList := 0;
        exit;
    end;

    SumList := i^.value + SumList(i^.next);
end;


procedure Clean (var i: ItemPtr);
begin
    if (i = nil) then
        exit;
    Clean(i^.next);
    dispose(i);
end;

procedure CleanList (var l: List);
begin
    Clean(l.first);
    l.length := 0;
end;

var
    l: List;
    buffer: longint;
begin
    InitList(l);

    while not SeekEOF do
    begin
        read(buffer);
        AddToList(l, buffer);
    end;

    SortList(l);
    AddToSortedList(l, 42);
    AddToSortedListRecursive(l, 256);
    ShowEls(l);
    writeln('sum: ', SumList(l.first));
    CleanList(l);
end.