program remove_negatives;

type
    NodePtr = ^Node;
    Node = record
        value: longint;
        next: NodePtr;
    end;
    List = record
        first: NodePtr;
        last: NodePtr;
    end;

procedure ListInit(var l: List);
begin
    l.first := nil;
    l.last := nil;
end;

procedure ListAdd (var l: List; n: longint);
var tmp: NodePtr;
begin
    new(tmp);
    tmp^.value := n;
    tmp^.next := nil;
    
    if l.first = nil then
    begin
        l.first := tmp;
        l.last := l.first
    end
    else
    begin
        l.last^.next := tmp;
        l.last := tmp;
    end;
end;

procedure ListGet(var l: List; var b: longint);
var tmp: NodePtr;
begin
    tmp := l.first;
    b := tmp^.value;
    l.first := l.first^.next;
    if (l.first = nil) then
        l.last := nil;

    dispose(tmp);
end;

procedure RemoveNegativeNumbers1(var l: List);
var tmp: NodePtr;
var tmp2: NodePtr;
begin
    if l.first <> nil then
    begin
        // remove in the beginning
        while l.first^.value < 0 do
        begin
            tmp := l.first;
            l.first := l.first^.next;
            dispose(tmp)
        end;
    end;

    if l.first <> nil then
    begin
        // first el is guranteed to exist
        tmp := l.first;

        while tmp^.next <> nil do
        begin
            if (tmp^.next^.value < 0) then
            begin
                tmp2 := tmp^.next;
                tmp^.next := tmp^.next^.next;
                dispose(tmp2);
            end
            else
                tmp := tmp^.next;
        end;
    end;
end;

procedure RemoveNegativeNumbers2 (var l: List);
var
    tmp: NodePtr;
    pointer_to_pointer: ^NodePtr;
begin
    pointer_to_pointer := @(l.first); // address to address to first
    // pointer_to_pointer^ - address to first
    // pointer_to_pointer^^ - first
    // pointer_to_pointer^^.next = address to next
    // @(pointer_to_pointer^^.next) - address to address to next

    while pointer_to_pointer^ <> nil do
    begin
        if (pointer_to_pointer^^.value < 0) then
        begin
            tmp := pointer_to_pointer^; // points to current
            pointer_to_pointer^ := pointer_to_pointer^^.next;
            dispose(tmp);
        end
        else
            pointer_to_pointer := @(pointer_to_pointer^^.next);
    end;
end;

var 
    buffer: longint;
    queue: List;
begin
    ListInit(queue);

    while not SeekEOF do
    begin
        read(buffer);
        ListAdd(queue, buffer);
    end;

    RemoveNegativeNumbers2(queue);

    writeln('Result: ');
    while queue.first <> nil do
    begin
        ListGet(queue, buffer);
        writeln(buffer);
    end;
end.