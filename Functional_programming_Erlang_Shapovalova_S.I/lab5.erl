-module(lab5).
-export([main/3]).

main(List1, List2, List3) ->
    sublist(List1, 1, length(List1) / 3) ++
    sublist(List2, length(List2) / 3 + 1, 2 * length(List2) / 3) ++
    sublist(List3, 2 * length(List3) / 3 + 1, length(List3)).

sublist(List, Start, End) ->
    sublistInner(List, Start, End, 1).

sublistInner([_H|T], Start, End, Counter) when Counter < Start ->
    sublistInner(T, Start, End, Counter + 1);
sublistInner([H|T], Start, End, Counter) when Counter =< End ->
    [H|sublistInner(T, Start, End, Counter + 1)];
sublistInner(_, _, _, _) -> [].
