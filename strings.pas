program strings;
var
    hello: array [1..30] of char;
    hello_2: string;
    string_length: integer;
    string_length_2: integer;

function CustomUpCase (str: string): string;
var 
    i, str_len, letter_code: integer;
begin
    str_len := length(str);

    for i := 1 to str_len do
    begin
        if (str[i] < 'a') or (str[i] > 'z') then Continue;

        letter_code := ord(str[i]);
        str[i] := chr(letter_code - 32);
    end;

    CustomUpCase := str;
end;

function CustomLowerCase (str: string): string;
var 
    i, str_len, letter_code: integer;
begin
    str_len := length(str);

    for i := 1 to str_len do
    begin
        if (str[i] < 'A') or (str[i] > 'Z') then Continue;

        letter_code := ord(str[i]);
        str[i] := chr(letter_code + 32);
    end;

    CustomLowerCase := str;
end;

begin
    hello := 'Hello, world!';
    hello_2 := 'Hello, world!';
    string_length := ord(hello[0]);
    string_length_2 := ord(hello_2[0]);
    writeln(hello, string_length);
    writeln(hello_2, string_length_2, length(hello_2));
    writeln(CustomUpCase(hello_2));
    writeln(CustomLowerCase(hello_2));
end.