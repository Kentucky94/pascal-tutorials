program match_pattern;

function MyMatchPattern(str, ptrn: string; str_idx, ptrn_idx: integer): boolean;
var
    i: integer;
    has_str_symbol: boolean;
    has_ptrn_symbol: boolean;
    first_str_char: char;
    first_ptrn_char: char;
    found_star_match: boolean;
begin
    has_str_symbol := str_idx <= length(str);
    has_ptrn_symbol := ptrn_idx <= length(ptrn);
    first_str_char := str[str_idx];
    first_ptrn_char := ptrn[ptrn_idx];

    if (has_ptrn_symbol) then // if there is still a pattern
    begin
        if(first_ptrn_char = '*') then
        begin
            found_star_match := false;

            for i := 0 to length(str) - str_idx + 1 do
            begin
                if MyMatchPattern(str, ptrn, str_idx + i, ptrn_idx + 1) then
                begin
                    found_star_match := true;
                    break;
                end;
            end;

            MyMatchPattern := found_star_match
        end
        else
        begin
            if (not has_str_symbol) or ((first_str_char <> first_ptrn_char) and (first_ptrn_char <> '?')) then
            begin
                MyMatchPattern := false 
            end
            else
                MyMatchPattern := MyMatchPattern(str, ptrn, str_idx + 1, ptrn_idx + 1)
        end;
    end
    else
    begin
        if (has_str_symbol) then
            MyMatchPattern := false
        else
            MyMatchPattern := true;
    end;
end;

function MyMatch(str, pat: string): boolean;
begin
    MyMatch := MyMatchPattern(str, pat, 1, 1);
end;

// function MatchPattern(var str, ptrn: string; str_idx, ptrn_idx: integer): boolean;
// var
//     i: integer;
//     no_string_left: boolean;
//     no_pattern_left: boolean;
// begin
//     while true do
//     begin
//         no_string_left := str_idx > length(str);
//         no_pattern_left := ptrn_idx > length(ptrn);

//         if no_pattern_left then
//         begin
//             MatchPattern := no_string_left;
//             exit;
//         end;

//         if (ptrn[ptrn_idx] = '*') then
//         begin
//             for i := 0 to length(str) - str_idx + 1 do // rest of the string
//                 if (MatchPattern(str, ptrn, str_idx + i, ptrn_idx + 1)) then
//                 begin
//                     MatchPattern := true;
//                     exit;
//                 end;

//             MatchPattern := false;
//             exit
//         end;

//         if no_string_left or ((str[str_idx] <> ptrn[ptrn_idx]) and (ptrn[ptrn_idx] <> '?')) then
//         begin
//             MatchPattern := false;
//             exit
//         end;

//         str_idx := str_idx + 1;
//         ptrn_idx := ptrn_idx + 1;
//     end;
// end;

// function Match(str, pat: string): boolean;
// begin
//     Match := MatchPattern(str, pat, 1, 1);
// end;

var
    res: boolean;
    s, p: string;
begin
    p := '**?et';
    s := 'abbey';
    res := MyMatch(s, p);

    writeln(res)
end.