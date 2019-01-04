#!/usr/bin/env swipl
likes(さーばる, じゃぱりまん).
likes(かばん, じゃぱりまん).
likes(らっきーびーすと, かばん).

friend(X, Y) :- \+(X = Y), likes(X, Z), likes(Y, Z).
