
high_low_split(_,[],[],[]).
high_low_split(T,[T|Tail],Lows,Bigs) :- high_low_split(T,Tail,Lows,Bigs).
high_low_split(T,[Head|Tail],[Head|Lows],Bigs) :- T > Head, high_low_split(T,Tail,Lows,Bigs).
high_low_split(T,[Head|Tail],Lows,[Head|Bigs]) :- T < Head, high_low_split(T,Tail,Lows,Bigs).

q_sort(Sorted,[Pibot,V]) :-
  high_low_split(Pibot,[V],Lows,Bigs),
  append(Lows,[Pibot|Bigs],Sorted).

q_sort(Sorted,[Pibot|Tail]) :-
  high_low_split(Pibot,Tail,Lows,Bigs),
  append(Lows,[Pibot|Bigs],Sorted).
