program ReadReverseNums;

type 
    listtempointer = ^listitem;
    listitem = record
        value: integer;
        next: listtempointer;
    end;

// procedure ReadListContent (current: listtempointer);
// begin
//     if (current = nil) then
//         exit;

//     writeln('value ', current^.value);

//     ReadListContent(current^.next);
// end;

// var
//     i: integer;
//     prevItem: listtempointer;
//     nextItem: listtempointer;
// begin
//     prevItem := nil;
//     nextItem := nil;

//     while not SeekEOF do
//     begin
//         read(i);
        
//         if prevItem = nil then // at start
//         begin
//             new(prevItem);
//             prevItem^.value := i;
//         end
//         else
//         begin
//             nextItem := prevItem;
//             new(prevItem);
//             prevItem^.value := i;
//             prevItem^.next := nextItem;
//         end;
//     end;

//     ReadListContent(prevItem);

//     writeln('End of file')
// end.

var
    first, temp: listtempointer;
    i: integer;
begin
    first := nil;

    while not SeekEOF do
    begin
        read(i);
        new(temp);
        temp^.value := i;
        temp^.next := first;
        first := temp;
    end;

    temp := first;
    while temp <> nil do
    begin
        writeln(temp^.value);
        temp := temp^.next;
    end;

    // cleaning
    while first <> nil do
    begin
        temp := first^.next;
        dispose(first);
        first := temp
    end;
end.