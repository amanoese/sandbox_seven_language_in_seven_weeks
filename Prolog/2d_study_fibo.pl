fibo(1,1).
fibo(1,2).
fibo(Result,Count) :-
  Count > 0,
  Count1 is Count - 1,
  Count2 is Count - 2,
  fibo(Result1,Count1),
  fibo(Result2,Count2),
  Result is Result1 + Result2.
