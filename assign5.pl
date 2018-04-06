
/*================================================
 
       T-501-FMAL Programming Languages
       Reykjavik University
       Assignment 5: Prolog
       Assignment Due: 06.04.2018
       Authors: Edda Steinunn,
                Skúli Arnarsson
               
 =================================================*/



/**********************************************
 *                 PROBLEM 1
 **********************************************/
% I.
/* Code in Prolog a predicate second/2 that returns the second element
 * of the given list. (If the list is too short, it must fail.) */
second([_,Second|_], Second).
% II.
/* Code a predicate penultim/2 that returns the penultimate
 * (one but the last) element of thegiven list.
 * (If the list is too short, it must fail.)
 * Do not reverse the list for this. */
penultim([Penultimate, _Ultimate|[]], Penultimate):- !.
penultim([_|T], Penultimate):- penultim(T,Penultimate).
% III.
/* Code  a  predicate replSecond/3 that  replaces
 * the  second  element  of  the  given  list  with  the given value.
 * (If the list is too short it must fail.) */
replSecond([First,_|Rest], Val, [First, Val|Rest]):- !.
% IV.
/* Code a predicate replPenultim/3 that replaces the
 * penultimate element of the given list with the given value.
 * (If the list is too short it must fail.)*/
replPenultim([_Penultimate, Ultimate|[]], Val, [Val, Ultimate|[]]):- !.
replPenultim([H|T], Penultimate, [H|ResultList]):- replPenultim(T, Penultimate, ResultList).



/**********************************************
 *                 PROBLEM 2
 **********************************************/
/* Code a predicate uniqueElems/1 for checking that the given list
 * contains no repeated elements. (You may assume that the given list does
 * not contain uninstantiated variables.) */
isUniqueElem(_Elem, []).
isUniqueElem(Elem, [Elem|_]):- !, false.
isUniqueElem(_, [_|[]]).
isUniqueElem(Elem, [_|Rest]):- isUniqueElem(Elem, Rest), !.
uniqueElems([]).
uniqueElems([H|T]):- isUniqueElem(H, T), !, uniqueElems(T), !.



/**********************************************
 *                 PROBLEM 3
 **********************************************/
/* Code a predicate shuffle/3 that shuffles the two given lists into a third,
 * i.e., interleaves them insome way: the resulting list contains all
 * elements of both given lists and only those, in their order of appearance
 * in the given lists, but interleaved arbitrarily. The predicate must be
 * able to accept and generate all valid outcomes of shuffling. */
shuffle([], List, List).
shuffle(List, [], List).
shuffle([H1|T1], [H2|T2], [H1|Rest]):- shuffle(T1, [H2|T2], Rest).
shuffle([H1|T1], [H2|T2], [H2|Rest]):- shuffle([H1|T1], T2, Rest).



/**********************************************
 *                 PROBLEM 4
 **********************************************/
% I.
/* Code a predicate winner/2 that checks whether a given player
 * (either x or o) has won tic-tac-toe, which means that he has occupied
 * a line of three squares (horizontally, diagonally or vertically). */
hasWon(Player, [Player,Player,Player,_,_,_,_,_,_]). % horizontal win
hasWon(Player, [_,_,_,Player,Player,Player,_,_,_]). % horizontal win
hasWon(Player, [_,_,_,_,_,_,Player,Player,Player]). % horizontal win
hasWon(Player, [Player,_,_,Player,_,_,Player,_,_]). % vertical win
hasWon(Player, [_,Player,_,_,Player,_,_,Player,_]). % vertical win
hasWon(Player, [_,_,Player,_,_,Player,_,_,Player]). % vertical win
hasWon(Player, [Player,_,_,_,Player,_,_,_,Player]). % diagonal win
hasWon(Player, [_,_,Player,_,Player,_,Player,_,_]). % diagonal win
winner(Player, Board):- hasWon(Player, Board), !.
% II.
/* Code a predicate move/3 that checks whether the given transition
 * between two configurations of the board is legal for a given player.
 * This means that the new configuration differs from the previous one by
 * exactly one formerly free square being now occupied by the player.
 * The predicate should also be able to generate all legal moves from the
 * given configuration for the given player. */
move(Player, [free|T], [Player|T]).
move(Player, [Pos|Board1], [Pos|Board2]):- move(Player, Board1, Board2).



/**********************************************
 *                 PROBLEM 5
 **********************************************/
/* In chess, a knight’s move is the movement of two squares vertically and
 * one square horizontally or two squares horizontally and one square vertically.
 * Let us represent a square on the chessboard by R/C where R and C are integers
 * between 1 and 8. */
% I.
/* Code a predicate moveK/2 that checks whether a move from the first of the
 * given squares to the second is legal and can also generate all legal moves
 * from the first square. */
moveK(R1/C1, R2/C2):- C1+2 < 9, R1+1 < 9, C2 is C1+2, R2 is R1+1.
moveK(R1/C1, R2/C2):- C1+2 < 9, R1-1 > 0, C2 is C1+2, R2 is R1-1.
moveK(R1/C1, R2/C2):- C1-2 > 0, R1+1 < 9, C2 is C1-2, R2 is R1+1.
moveK(R1/C1, R2/C2):- C1-2 > 0, R1-1 > 0, C2 is C1-2, R2 is R1-1.
moveK(R1/C1, R2/C2):- R1+2 < 9, C1+1 < 9, R2 is R1+2, C2 is C1+1.
moveK(R1/C1, R2/C2):- R1+2 < 9, C1-1 > 0, R2 is R1+2, C2 is C1-1.
moveK(R1/C1, R2/C2):- R1-2 > 0, C1+1 < 9, R2 is R1-2, C2 is C1+1.
moveK(R1/C1, R2/C2):- R1-2 > 0, C1-1 > 0, R2 is R1-2, C2 is C1-1.
% II.
/* Code a predicate journey/3 that checks whether a knight can travel
 * from the first of the given squares to the second in at most the g iven
 * number of steps. The predicate must also be usable for finding all
 * squares it can travel to from the first square in at most the given
 * number of steps. */
journey(From, From, _Amount).
journey(_, _, 0):- !, false.
journey(From, To, 1):- !, moveK(From, To).
journey(From, To, Amount):-  Amount1 is Amount - 1, moveK(From, Dest), journey(Dest, To, Amount1).