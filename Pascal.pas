
// Compiled in OnlineGDB

program CeasarCipher;
    
function Encrypt(text: string; shift: integer): string;
var 
  i, index: integer;
begin
  for i := 1 to Length(text) do
  begin
    if text[i] in ['A'..'Z', 'a'..'z'] then
    begin
      if text[i] in ['A'..'Z'] then
        index := Ord(text[i]) - Ord('A') + 1
      else
        index := Ord(text[i]) - Ord('a') + 1;
        
      index := (index + shift + 26) mod 26; 
      if index = 0 then
        index := 26; 

      if text[i] in ['A'..'Z'] then
        text[i] := Chr(Ord('A') + (index - 1))
      else
        text[i] := Chr(Ord('a') + (index - 1));
    end;
  end;
  Encrypt := text;
end;

function Decrypt(text: string; shift: integer): string;
begin
  // negative shift for decryption
  Decrypt := Encrypt(text, -shift);
end;

//do all 26 combinations
procedure Solve(text: string);
var
    i: integer;
    encryptedText: string;
begin
    for i := 1 to 26 do 
        begin
        encryptedText := Encrypt(text, i);
        writeln('Decrypted text: ', encryptedText)
        end;
end;

var
  encryptedText: string;
begin //test cases
  encryptedText := Encrypt('Hello Pascal', 3);
  writeln('Encrypted text: ', encryptedText);
  encryptedText := Decrypt('abcdefghijklmnopqrstuvwxyz', 3);
  writeln('Encrypted text: ', encryptedText);
  Solve('hello');
end.
