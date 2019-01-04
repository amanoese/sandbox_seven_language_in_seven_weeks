#!/usr/bin/env gprolog
likes(wallace, cheese).
likes(grommit, cheese).
likes(wendolene, sheep).

friend(X, Y) :- \+(X = Y), likes(X, Y), likes(Y, Z).
