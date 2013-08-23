-module(bubble_sort).
-export([sort/1]).

sort(List) -> sort(List, [], false).

sort([], SortedList, false) ->
    lists:reverse(SortedList);

sort([], SortedList, true) ->
    sort(lists:reverse(SortedList), [], false);

sort([X, Y | List], SortedList, _) when X > Y->
    sort([X | List], [Y | SortedList], true);

sort([X | List], SortedList, Swaped) ->
    sort(List, [X | SortedList], Swaped).

