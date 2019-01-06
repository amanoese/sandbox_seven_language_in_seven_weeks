
%sudoku([ _, _, 2, 3,
%         _, _, _, _,
%         _, _, _, _,
%         3, 4, _, _, ]
%       , Solution).

:- use_module(library(clpfd)).
:- use_module(library(chr)).

main :-
  sudoku([ _, _, 2, 3, _, _, _, _, _, _, _, _, 3, 4, _, _ ] , Solution),
    squaer_print(Solution,4).

squaer_print([],_).
squaer_print(List,N) :-
  hprolog:split_at(N,List,Row,TailList),
  print(Row),
  nl,
  squaer_print(TailList,N).



sudoku(Puzzle,Solution) :-
  Solution = Puzzle,
  Puzzle =
  [ S11, S12, S13, S14
  , S21, S22, S23, S24
  , S31, S32, S33, S34
  , S41, S42, S43, S44
  ],
  Puzzle ins 1..4,

  Row1 = [ S11, S12, S13, S14 ],
  Row2 = [ S21, S22, S23, S24 ],
  Row3 = [ S31, S32, S33, S34 ],
  Row4 = [ S41, S42, S43, S44 ],

  Col1 = [ S11, S21, S31, S41],
  Col2 = [ S12, S22, S32, S42],
  Col3 = [ S13, S23, S33, S43],
  Col4 = [ S14, S24, S34, S44],

  Squaer1 = [ S11, S12, S21, S22],
  Squaer2 = [ S13, S14, S23, S24],
  Squaer3 = [ S31, S32, S41, S42],
  Squaer4 = [ S33, S34, S43, S44],

  valid(
  [ Row1, Row2, Row3, Row4
  , Col1, Col2, Col3, Col4
  , Squaer1, Squaer2, Squaer3, Squaer4
  ]).

valid([]).
valid([Head|Tail]) :-
  all_different(Head),
  valid(Tail).

