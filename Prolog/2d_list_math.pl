count(0,[]).
count(Count,[Head|Tail]) :- count(TailCount,Tail), Count is TailCount + 1.

sum(0,[]).
sum(Sum,[Head|Tail]) :- sum(Prev,Tail), Sum is Prev + Head.

average(Average,List) :- count(Count,List), sum(Sum,List), Average is Sum / Count.
