min(Result,[Result]).
min(X,[X,Y]) :- X < Y.
min(Y,[X,Y]) :- Y < X.
min(Result,[A,B|Tail]) :-
  min(_Min,[A,B]),
  min(Result,[_Min|Tail]).
