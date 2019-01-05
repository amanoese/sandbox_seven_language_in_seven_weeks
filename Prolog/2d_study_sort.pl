
high_low_split([T],[],[T],[]).
high_low_split([T,T|Tail],Lows,[T|Sames],Highs) :- high_low_split([T|Tail],Lows,Sames,Highs).
high_low_split([T,Head|Tail],[Head|Lows],Sames,Highs) :- T > Head, high_low_split([T|Tail],Lows,Sames,Highs).
high_low_split([T,Head|Tail],Lows,Sames,[Head|Highs]) :- T < Head, high_low_split([T|Tail],Lows,Sames,Highs).

q_sort([],[]).
q_sort(Sorted,List) :-
  high_low_split(List,Lows,Sames,Highs),
  q_sort(LowSorted,Lows),
  q_sort(HighSorted,Highs),
  append(LowSorted,Sames,LowAndSames),
  append(LowAndSames,HighSorted,Sorted).
