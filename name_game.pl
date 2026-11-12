

:- dynamic letter/1.

% the starting set of letters
letter(a).
letter(b).
letter(c).

start :-
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    do(Choice).

do(1) :- display_letters, menu.

do(2) :-
    write('Enter the letter to add: '), read(L),
    assertz(letter(L)),
    write('The letter has been added'), nl,
    menu.

do(3) :-
    write('Enter the letter to add at the top: '), read(L),
    asserta(letter(L)),
    write('The letter has been added at the top'), nl,
    menu.

do(4) :-
    write('Enter the letter to add at the bottom: '), read(L),
    assertz(letter(L)),
    write('The letter has been added at the bottom'), nl,
    menu.

do(5) :-
    write('Enter the letter to delete: '), read(L),
    (   retract(letter(L))
    ->  write('The letter has been deleted'), nl
    ;   write('That letter is not in the set'), nl
    ),
    menu.

do(6) :-
    retractall(letter(_)),
    write('All letters have been deleted'), nl,
    menu.

do(7) :-
    nl, write('exit...'), nl.

do(_) :-
    nl, write('Sorry, you chose the wrong option...'), nl,
    menu.

display_letters :-
    write('The current set of letters:'), nl,
    letter(L),
    write(L), nl,
    fail.
display_letters.
