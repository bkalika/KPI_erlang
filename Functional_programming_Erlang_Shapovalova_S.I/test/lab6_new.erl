-module(lab6_new).
-export([main/0]).

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

main() ->
    Matrix = matrix_data(2),
    First = lists:nth(1, lists:nth(1, Matrix)),
    Last = lists:nth(1, lists:nth(length(Matrix), Matrix)),
    replace(Matrix, First, Last, length(Matrix), []).

replace([R|Rs], _First, Last, Counter, []) ->
    replace(Rs, _First, Last, Counter - 1, [replaceAt(1, R, Last, [])]);
replace([R|_Rs], First, _Last, 1, Acc) ->
    lists:reverse([replaceAt(1, R, First, [])|Acc]);
replace([R|Rs], _First, _Last, Counter, Acc) ->
    replace(Rs, _First, _Last, Counter - 1, [R|Acc]).

% +Index of replacement, List, Replacer, Accumulator
% Replaces element with a Replacer at a given Index
% -New List
replaceAt(1, [_H|T], Replacer, Acc) ->
    lists:reverse(Acc)++[Replacer]++T;
replaceAt(N, [H|T], Replacer, Acc) ->
    replaceAt(N - 1, T, Replacer, [H|Acc]).