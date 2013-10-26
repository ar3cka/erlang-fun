-module(insertion_sort).
-export([sort/1]).

sort(List) when is_list(List) -> sort(List, []).


sort([], []) -> [];

sort([], Acc) -> Acc;

sort([H | Tail], []) -> sort(Tail, [H]);

sort([X | Tail], [Y | SortedTail]) when X =< Y ->
    sort(Tail, [X, Y | SortedTail]);

sort([X | Tail], [Y | SortedTail]) ->
    SortedList = [Y | insert(X, SortedTail)],
    sort(Tail, SortedList).


insert(X, [Y | Tail]) when X =< Y -> [X, Y | Tail];

insert(X, [Y | Tail]) -> [Y | insert(X, Tail)];

insert(X, []) -> [X].

