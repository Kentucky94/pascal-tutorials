program olympiad_counter;
const 
    MaxSchool = 67;
    MaxGroup = 100;
type
    CountersArray = array [0..MaxSchool - 1] of integer;
var 
    i: integer;
    arr: CountersArray;
    top_school: integer;

procedure FillCounterArray();
var 
    line_data: integer;
    current_school: integer;

begin
    {$I-}
    while not SeekEof do
    begin
        readln(line_data);

        if IOResult <> 0 then
        begin
            writeln('incorrect data');
            halt(1);
        end;

        current_school := line_data div MaxGroup;

        arr[current_school] := arr[current_school] + 1;
    end;    
end;

procedure FindTopSchool();
var
    max: integer;
    max_school: integer;

begin
    max := 0;
    max_school := 0;

    for i := 0 to (MaxSchool - 1) do
    begin
        if (arr[i] > max) then
            max_school := i;
    end;    

    top_school := max_school;
end;

begin
    for i := 0 to (MaxSchool - 1) do
    begin
        arr[i] := 0;
    end;

    FillCounterArray;
    FindTopSchool;

    writeln('Top school is: ', top_school);
end.