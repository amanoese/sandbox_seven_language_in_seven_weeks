rsort([],[]).
rsort([A],[A]).
rsort(Result,[Head|Tail]) :-
  rsort(TailResult,Tail),
  append(TailResult,[Head],Result).
