program ReadWriteNumsTwice;

type 
    listtempointer = ^listitem;
    listitem = record
        value: integer;
        next: listtempointer;
    end;

procedure ReadListContent (current: listtempointer);
begin
    if (current = nil) then
        exit;

    writeln('value ', current^.value);

    ReadListContent(current^.next);
end;

var
    i: integer;
    firstItem: listtempointer;
    prevItem: listtempointer;
    nextItem: listtempointer;
begin
    firstItem := nil;
    prevItem := nil;
    nextItem := nil;

    while not SeekEOF do
    begin
        read(i);
        
        if firstItem = nil then // at start
        begin
            new(firstItem);
            firstItem^.value := i;
            nextItem := firstItem;
        end
        else
        begin
            prevItem := nextItem;
            new(nextItem);
            nextItem^.value := i;
            prevItem^.next := nextItem;
        end;
    end;

    ReadListContent(firstItem);
    ReadListContent(firstItem);

    writeln('End of file')
end.