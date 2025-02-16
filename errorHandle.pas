program error_handle; 
var i: longint;

begin
    {$I-}
    writeln('Enter a nubber');
    read(i);

    if IOResult = 0 then
        writeln(i)
    else
        writeln('incorrect input')
end.