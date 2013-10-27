-module(merge_sort).
-export([sort/1, test_perf/1]).


sort([X]) -> [X];

sort(List) when is_list(List) ->
    {LeftList, RightList} = lists:split(length(List) div 2, List),
    SortedLeft = sort(LeftList),
    SortedRight = sort(RightList),
    merge(SortedLeft, SortedRight).

test_perf({M, F, A}) ->
    statistics(runtime),
    statistics(wall_clock),

    M:F(A),

    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1 * 1000,
    U2 = Time2 * 1000,
    io:format("Code time=~p (~p) microseconds~n", [U1,U2]).


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