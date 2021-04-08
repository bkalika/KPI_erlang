-module(lab3_remove_dubl).
-export([remove_dubl/1]).

remove_dubl(List)-> removing(List,[]). 
removing([],This) -> lists:reverse(This);
removing([A|Tail],Acc) -> 
    removing(delete_all(A,Tail),[A|Acc]).

delete_all(Item, [Item | Rest_of_list]) ->
    delete_all(Item, Rest_of_list);
delete_all(Item, [Another_item| Rest_of_list]) ->
    [Another_item | delete_all(Item, Rest_of_list)];
delete_all(_, []) -> [].
