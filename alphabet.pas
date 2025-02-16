program alphabet;

var
    c: char;
    s: string;

begin
    for c := 'A' to 'Z' do
        s := s + c;
        
    writeln(s);
end.