encrypt(Text, Shift) ->
   [translate(X,Shift) || X <- Text].
%translate function only accepts alphabetical characters, if an non-alphabetical character is found,  return that character unchanged
decrypt(Text,Shift) ->
   encrypt(Text,26 -shift).

translate(Character,Shift) when Character >= $A andalso Character =< $Z ->
   (Character - $A + Shift) rem 26 + $A;
   translate(Character,Shift) when Character >= $a andalso Character =< $z ->
   (Character - $a + Shift) rem 26 + $a;
   translate(X,_) ->
   X.

solve(Text)->
    solve(Text,26,[]).
solve(_Text,0,Output)->
    lists:reverse(Output);
solve(_Text,0,Output)->
    lists:reverse(Output);
    solve(Text,N,Output)->
    Result=encrypt(Text,N),
    solve(Text,N-1,[Result | Output]).
