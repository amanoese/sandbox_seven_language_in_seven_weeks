main :-
  use_module(library(clpfd)),
  use_module(library(lists)),
  between(1,9,Number),
  print((X,Y)).

%list_generator(List,Start,End).
list_generator(List,E,E).


all_pair([],[],_).
all_pair([(X,Head)|TailPairs],[Head|Tail],X) :-
  all_pair(TailPairs,Tail,X).
