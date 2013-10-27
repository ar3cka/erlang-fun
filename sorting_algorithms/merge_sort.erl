-module(merge_sort).
-export([sort/1, merge/2]).

sort(List) when is_list(List) -> List.

merge(LeftList, RightList) -> lists:reverse(merge(LeftList, RightList, [])).


merge([], [], SortedList) -> SortedList;

merge([], [X | Tail], SortedList) -> merge([], Tail, [X | SortedList]);

merge([X | Tail], [], SortedList) -> merge(Tail, [], [X | SortedList]);

merge([X | TailLeft], [Y | TailRight], SortedList) when X < Y ->
    merge(TailLeft, [Y | TailRight], [X | SortedList]);

merge([X | TailLeft], [Y | TailRight], SortedList) ->
    merge([X | TailLeft], TailRight, [Y | SortedList]).