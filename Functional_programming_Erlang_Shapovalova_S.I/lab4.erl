-module(lab4).
-export([insert/2]).

%+(List, Term)
%-New List
insert(Xs, Term)->
	N = length(Xs) div 2 + 1,
	[_|L] = part2(Xs, N),
	part1(Xs, N)++[Term|L].


%+(List, N)
%-Part before nth item
part1([X|Xs], I) when I > 0 ->
	[X|part1(Xs, I - 1)];
part1(_, 0) -> [].


%+(List, N)
%-Part after nth item
part2([_X|Xs], I) when I > 1 ->
	part2(Xs, I - 1);
part2(L, 1) -> L.
