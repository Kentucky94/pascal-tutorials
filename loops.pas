program loops;
var num: integer;

// begin
//     while not ((num mod 2) = 1) do
//     begin
//         writeln('Please enter an odd number');
//         read(num);
//     end;

//     writeln('Great!')
// end.

// begin
//     repeat
//         writeln('Please enter an odd number');
//         read(num);
//     until (num mod 2) = 1;

//     writeln('Great!')
// end.

// begin
//     for num := 1 to 20 do
//         writeln('Great! ', num)
// end.

begin
    for num := 20 downto 1 do
        writeln('Great! ', num)
end.