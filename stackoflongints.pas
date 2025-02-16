program stack_of_longints;

type 
    LongintsItemPointer = ^LongintsItem;
    LongintsItem = record
        value: longint;
        next: LongintsItemPointer;
    end;
    StackOfLongints = LongintsItemPointer;

procedure SOLInit (var s: StackOfLongints);
begin
    s := nil;
end;

procedure SOLPush(var s: StackOfLongints; v: longint);
var 
    instance: LongintsItemPointer;
begin
    new(instance);
    instance^.value := v;
    instance^.next := s;
    s := instance;
end;

procedure SOLPop(var s: StackOfLongints; var b: longint);
var 
    instance: LongintsItemPointer;
begin
    b := s^.value;
    instance := s;
    s := s^.next;
    dispose(instance);
end;

function SOLIsEmpty(var s: StackOfLongints): boolean;
begin
    SOLIsEmpty := s = nil;
end;

var
    input: longint;
    buffer: longint;
    stack: StackOfLongints;
begin
    SOLInit(stack);    

    while not SeekEOF do
    begin
        read(input);
        SOLPush(stack, input);
    end;

    while not SOLIsEmpty(stack) do
    begin
        SOLPop(stack, buffer);
        writeln(buffer);
    end;
end.