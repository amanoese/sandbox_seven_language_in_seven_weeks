
high_low_split(_,[],[],[]).
high_low_split(T,[T|Tail],Lows,[T|Highs]) :- high_low_split(T,Tail,Lows,Highs).
high_low_split(T,[Head|Tail],[Head|Lows],Highs) :- T > Head, high_low_split(T,Tail,Lows,Highs).
high_low_split(T,[Head|Tail],Lows,[Head|Highs]) :- T < Head, high_low_split(T,Tail,Lows,Highs).

q_sort([],[]).
q_sort([T],[T]).

q_sort(Sorted,[Pibot,V]) :-
  high_low_split(Pibot,[V],Lows,Highs),
  append(Lows,[Pibot|Highs],Sorted).

q_sort(Sorted,[Pibot|Tail]) :-
  high_low_split(Pibot,Tail,Lows,Highs),
  q_sort(LowSorted,Lows),
  q_sort(HighSorted,Highs),
  append(LowSorted,[Pibot|HighSorted],Sorted).
