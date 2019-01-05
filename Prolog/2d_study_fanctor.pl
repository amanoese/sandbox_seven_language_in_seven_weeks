my_fanctor(1, 0).
my_fanctor(Result,Num) :-
  Num > 0,
  NumPrev is Num - 1,
  my_fanctor(TailResult,NumPrev),
  Result is TailResult * Num.
