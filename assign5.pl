/*=========================================
 
       T-501-FMAL Programming Languages
       Reykjavik University
       Assignment 5: Prolog
       Assignment Due: 06.04.2018
       Authors:	Edda Steinunn,
       			Skúli Arnarsson
               
 ==========================================*/



/**********************
 *		PROBLEM 1
 **********************/

% I.
/* Code in Prolog a predicate second/2 that returns the second element
 * of the given list. (If the list is too short, it must fail.) */
second([], _Second):- false.
second([_H|[]], _Second):- false.
second([_First,Second|_Rest], Second):- !.

% II.
/* Code a predicate penultim/2 that returns the penultimate
 * (one but the last) element of thegiven list.
 * (If the list is too short, it must fail.)
 * Do not reverse the list for this. */
penultim([], _Penultimate):- false.
penultim([_H|[]], _Penultimate):-false.
penultim([Penultimate, _Ultimate|[]], Penultimate):- !.
penultim([_H|T], Penultimate):- penultim(T,Penultimate).

% III.
/* Code  a  predicate replSecond/3 that  replaces
 * the  second  element  of  the  given  list  with  the given value.
 * (If the list is too short it must fail.) */
replSecond([], _Val, _ResultList):- false.
replSecond([_H|[]], _Val, _ResultList):- false.
replSecond([First,_Second|Rest], Val, [First,Val|Rest]):- !.

% IV.
/* Code a predicate replPenultim/3 that replaces the
 * penultimate element of the given list with the given value.
 * (If the list is too short it must fail.)*/
replPenultim([], _Val, _ResultList):- false.
replPenultim([_H|[]], _Val, _ResultList):- false.
replPenultim([_Penultimate, Ultimate|[]], Val, [Val, Ultimate|[]]):- !.
replPenultim([H|T], Penultimate, [H|ResultList]):- replPenultim(T, Penultimate, ResultList).



/**********************
 *		PROBLEM 2
 **********************/

/* Code a predicate uniqueElems/1 for checking that the given list
 * contains no repeated elements. (You may assume that the given list does
 * not contain uninstantiated variables.) */
isUniqueElem(_Elem, []).
isUniqueElem(Elem, [Elem|_Rest]):- !, false.
isUniqueElem(_Elem, [_First|[]]).
isUniqueElem(Elem, [_First|Rest]):- isUniqueElem(Elem, Rest), !.
uniqueElems([]).
uniqueElems([H|T]):- isUniqueElem(H, T), !, uniqueElems(T), !.



/**********************
 *		PROBLEM 3
 **********************/

/* Code a predicate shuffle/3 that shuffles the two given lists into a third,
 * i.e., interleaves them insome way: the resulting list contains all
 * elements of both given lists and only those, in their order of appearance
 * in the given lists, but interleaved arbitrarily. The predicate must be
 * able to accept and generate all valid outcomes of shuffling. */
shuffle([], List, List).
shuffle(List, [], List).
shuffle([H1|T1], [H2|T2], [H1|Rest]):- shuffle(T1, [H2|T2], Rest).
shuffle([H1|T1], [H2|T2], [H2|Rest]):- shuffle([H1|T1], T2, Rest).



/**********************
 *		PROBLEM 4
 **********************/

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



/**********************
 *		PROBLEM 5
 **********************/

/* In chess, a knight’s move is the movement of two squares vertically and
 * one square horizontally or two squares horizontally and one square vertically.
 * Let us represent a square on the chessboard by R/C where R and C are integers
 * between 1 and 8. */

% I.
/* Code a predicate moveK/2 that checks whether a move from the first of the
 * given squares to the second is legal and can also generate all legal moves
 * from the first square. */

% II.
/* Code a predicate journey/3 that checks whether a knight can travel
 * from the first of the given squares to the second in at most the given
 * number of steps. The predicate must also be usable for finding all
 * squares it can travel to from the first square in at most the given
 * number of steps. */



