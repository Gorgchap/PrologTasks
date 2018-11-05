% Copyright

implement main
    open core, console

class facts - examsDB
    algebra : (string Surame, integer Mark).
    geometry : (string Surame, integer Mark).
    history : (string Surame, integer Mark).

class predicates
    excellent : (string Surname) nondeterm anyflow.
clauses
    excellent(Surname) :-
        algebra(Surname, 5),
        geometry(Surname, 5),
        history(Surname, 5).

class predicates
    mathematician : (string Surname) nondeterm.
clauses
    mathematician(Surname) :-
        algebra(Surname, 4)
        or
        algebra(Surname, 5),
        geometry(Surname, 4)
        or
        geometry(Surname, 5).

class predicates
    bad_historians : (string Surname [out]) nondeterm.
clauses
    bad_historians(Surname) :-
        history(Surname, 1)
        or
        history(Surname, 2).

class predicates
    worst : (string Surname [out]) nondeterm.
clauses
    worst(Surname) :-
        algebra(Surname, 2)
        or
        geometry(Surname, 2)
        or
        history(Surname, 2).

clauses
    algebra("Бобров", 5).
    algebra("Вяткин", 5).
    algebra("Кротов", 2).
    algebra("Соснин", 4).
    algebra("Вавилов", 4).
    geometry("Бобров", 3).
    geometry("Вяткин", 5).
    geometry("Кротов", 3).
    geometry("Соснин", 4).
    geometry("Вавилов", 2).
    history("Бобров", 2).
    history("Вяткин", 5).
    history("Кротов", 3).
    history("Соснин", 4).
    history("Вавилов", 1).

    run() :-
        write("Вяткин отличник? "),
        if excellent("Вяткин") then
            write("Да")
        else
            write("Нет")
        end if,
        fail.

    run() :-
        write("\nОтличники: "),
        excellent(X),
        writef("% ", X),
        fail.

    run() :-
        write("\nСоснин математик? "),
        if mathematician("Соснин") then
            write("Да")
        else
            write("Нет")
        end if,
        fail.

    run() :-
        write("\nНеуспевающие по истории: "),
        bad_historians(X),
        writef("% ", X),
        fail.

    run() :-
        write("\nДвоечники: "),
        worst(X),
        writef("% ", X),
        fail.

    run() :-
        write("\nКонец задания 1").

end implement main

goal
    console::runUtf8(main::run).
