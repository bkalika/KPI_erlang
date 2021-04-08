-module(lab6).
-export([matrix_main/1]).

matrix_data(1)->
	[[2,1,1,1,1],
	[1,2,1,1,1],
	[1,1,1,1,1],
	[1,1,1,1,1],
	[1,1,1,1,11]];
matrix_data(2)->
	[[1,1,1,1,0],
	[1,1,1,0,0],
	[1,1,0,0,0],
	[1,0,0,0,0],
	[0,0,0,0,0]].

%+ Test#
matrix_main(K)->
	Ms = matrix_data(K),
	matrix_pro(Ms,1,0).

%+Matrix, Rows Counter, Accumulator,
%-Sum
matrix_pro([R|Rs],I,Acc)->
	matrix_pro(Rs,I+1,Acc+lists:nth(I, R));
matrix_pro([],_,S)->S.