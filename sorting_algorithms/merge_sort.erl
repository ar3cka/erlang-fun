-module(merge_sort).
-export([sort/1]).

sort([X]) -> [X];

sort(List) when is_list(List) ->
    {LeftList, RightList} = lists:split(length(List) div 2, List),
    SortedLeft = sort(LeftList),
    SortedRight = sort(RightList),
    merge(SortedLeft, SortedRight).


merge(LeftList, RightList) -> lists:reverse(merge(LeftList, RightList, [])).

merge([], [], SortedList) -> SortedList;

merge([], [X | Tail], SortedList) -> merge([], Tail, [X | SortedList]);

merge([X | Tail], [], SortedList) -> merge(Tail, [], [X | SortedList]);

merge(LeftList = [X | TailLeft], RightList = [Y | TailRight], SortedList) ->
    {Min, NewLeftList, NewRightList} =
        if
            X < Y -> {X, TailLeft, RightList};
            true   -> {Y, LeftList, TailRight}
        end,

    merge(NewLeftList , NewRightList, [Min | SortedList]).