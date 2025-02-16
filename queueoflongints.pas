program queue_of_longints;
type
    NodePtr = ^Node;
    Node = record
        value: longint;
        next: NodePtr;
    end;
    QueueOfLongints = record
        first, last: NodePtr;
    end;

procedure QOLInit (var q: QueueOfLongints);
begin
    q.first := nil;
    q.last := nil;
end;

procedure QOLPut (var q: QueueOfLongints; n: longint);
begin
    if q.first = nil then
    begin
        new(q.first);
        q.last := q.first;
    end
    else
    begin
        new(q.last^.next);
        q.last := q.last^.next
    end;

    q.last^.value := n;
    q.last^.next := nil;
end;

procedure QOLGet (var q: QueueOfLongints; var n: longint);
var tmp: NodePtr;
begin
    n := q.first^.value;
    tmp := q.first;
    q.first := q.first^.next;
    if (q.first = nil) then
        q.last := nil;

    dispose(tmp);
end;

function QOLIsEmpty (var q: QueueOfLongints): boolean;
begin
    QOLIsEmpty := q.first = nil;
end;

var
    queue: QueueOfLongints;
    buffer: longint;
begin
    QOLInit(queue);
    
    while not SeekEOF do
    begin
        read(buffer);
        QOLPut(queue, buffer);
    end;

    while not QOLIsEmpty(queue) do
    begin
        QOLGet(queue, buffer);
        writeln(buffer);
    end;
end.