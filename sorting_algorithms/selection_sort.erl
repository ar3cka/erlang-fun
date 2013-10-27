-module(selection_sort).
-export([sort/1]).

sort(List) when is_list(List) ->
    lists:reverse(sort(List, [])).


sort([], SortedList) -> SortedList;

sort(List, SortedList) ->
    Min = find_min(List),
    NewList = lists:delete(Min, List),
    sort(NewList, [Min | SortedList]).


find_min(List) when is_list(List) ->
    [H | Tail] = List,
    find_min(H, Tail).

find_min(X, []) -> X;

find_min(X, [Y | Tail]) when X > Y -> find_min(Y, Tail);

find_min(X, List) -> find_min(X, tl(List)).