program hello;
// begin
//     write('Hello, brand new world!')
// end.

procedure sayHello(message: string);
var i: integer;
begin
    for i := 1 to 10 do
    begin
        writeln(message)        
    end;
end;

begin
   sayHello('some text goes here'); 
end.