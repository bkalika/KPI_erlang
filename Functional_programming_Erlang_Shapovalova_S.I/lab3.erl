-module(lab3).
-export([func_main/4]).

%+(X, Final X, Step, N)
% -Result List
func_main(X, Xf, H, N)->
	func_list(X, Xf, H, N).

%+(X,Final X,Step,N)
% -Result List
func_list(X, Xf, H, N) when X =< Xf  + 0.001 ->
	Func_rez = sum_direct(X, N) + math:tan(X),
	[Func_rez | func_list(X + H, Xf, H, N)];
	func_list(X, Xf, _, _) when X > Xf -> [].

%+(X, Counter)
% -Result Sum
sum_direct(X, I) when I > 0 ->
	((X * X)/(I + X)) + sum_direct(X, I - 1);
	sum_direct(_X, 0) -> 0.
