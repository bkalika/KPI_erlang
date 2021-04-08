-module(myLists).
-export([main/1, matrix_data/1]).

% +Number of test data
% Returns matrix by number
% -Matrix
matrix_data(1)->
    [[1,2,3,4,5],
    [10,20,30,40,50],
    [100,200,300,400,500],
    [1000,2000,3000,4000,5000],
    [10000,20000,30000,40000,50000]];
matrix_data(2)->
    [[1,2,3,4,5,6],
    [10,20,30,40,50,60],
    [100,200,300,400,500,600],
    [1000,2000,3000,4000,5000,6000],
    [10000,20000,30000,40000,50000,60000],
    [100000,200000,300000,400000,500000,600000]].

% +Matrix
% Returns matrix with left parts of diagonales swapped
% -New matrix
% main(M) ->
%     swapAtRows(M, length(M) div 2, []).

% +Matrix, Number of row, Accumuluator
% Interchanges left halves of diagonals
% -New matrix
% swapAtRows(Matrix, Counter, []) when length(Matrix) rem 2 == 1 ->
%     swapAtRows(Matrix, Counter, [lists:nth(length(Matrix) div 2 + 1, Matrix)]);
% swapAtRows(_Matrix, 0, Acc) -> Acc;
% swapAtRows(Matrix, Counter, Acc) ->
%     First = lists:nth(Counter, lists:nth(Counter, Matrix)),
%     Second = lists:nth(Counter, lists:nth(length(Matrix) - Counter + 1, Matrix)),
%     NewAcc = [replaceAt(Counter, lists:nth(Counter, Matrix), Second, [])]++
%     Acc++
%     [replaceAt(Counter, lists:nth(length(Matrix) - Counter + 1, Matrix), First, [])],
%     swapAtRows(Matrix, Counter - 1, NewAcc).

% +Index of replacement, List, Replacer, Accumulator
% Replaces element with a Replacer at a given Index
% -New List
% replaceAt(1, [_H|T], Replacer, Acc) ->
%     lists:reverse(Acc)++[Replacer]++T;
% replaceAt(N, [H|T], Replacer, Acc) ->
%     replaceAt(N - 1, T, Replacer, [H|Acc]).

main(M) ->
    {D1, D2} = swap(M, length(M) div 2, 1, 1, [], []),
    insert(M, length(M) div 2, 1, 1, D1, D2, [], []).

swap([R|Rs], M, I, N, D1, D2) when I =< M ->
    swap(Rs, M, I + 1, N + 1, [lists:nth(N, R)|D1], D2);
swap([R|Rs], M, I, N, D1, D2) when I > M ->
    swap(Rs, M, I + 1, N - 1, D1, [lists:nth(N, R)|D2]);
swap([], _M, _I, _N, D1, D2) ->
    {lists:reverse(D1), lists:reverse(D2)}.

insert([R|Rs], M, I, N, [D1|D1s], D2, Acc1, Acc2) when I =< M ->
    insert(Rs, M, I + 1, N + 1, D1s, D2, [replaceAt(N, R, D1, [])|Acc1], Acc2);
insert([R|Rs], M, I, N, D1, [D2|D2s], Acc1, Acc2) when I > M ->
    insert(Rs, M, I + 1, N - 1, D1, D2s, Acc1, [replaceAt(N, R, D2, [])|Acc2]);
insert([], _M, _I, _N, _D1, _D2, Acc1, Acc2) ->
    lists:reverse(Acc1)++lists:reverse(Acc2).

% +Index of replacement, List, Replacer, Accumulator
% Replaces element with a Replacer at a given Index
% -New List
replaceAt(1, [_H|T], Replacer, Acc) ->
    lists:reverse(Acc)++[Replacer]++T;
replaceAt(N, [H|T], Replacer, Acc) ->
    replaceAt(N - 1, T, Replacer, [H|Acc]).