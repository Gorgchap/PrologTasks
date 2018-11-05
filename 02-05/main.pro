% Copyright

implement main
    open core, console

class predicates
    check : (integer A, integer B, integer C) nondeterm.
clauses
    check(A, B, C) :-
        not(A * A <> B * B + C * C)
        or
        not(B * B <> A * A + C * C)
        or
        not(C * C <> A * A + B * B).

class facts - logicDB
    person : (string Name).
    furniture : (string Entitlement).

class predicates
    conformity : (string Person, string Furniture) nondeterm anyflow.
clauses
    conformity(Person, Furniture) :-
        person(Person),
        furniture(Furniture),
        Person = "Коля",
        not(Furniture = "кровать"),
        not(Furniture = "стул")
        or
        person(Person),
        furniture(Furniture),
        Person = "Света",
        not(Furniture = "стул"),
        not(conformity("Коля", Furniture))
        or
        person(Person),
        furniture(Furniture),
        Person = "Оля",
        not(conformity("Коля", Furniture)),
        not(conformity("Света", Furniture)).

clauses
    person("Коля").
    person("Света").
    person("Оля").
    furniture("кровать").
    furniture("стул").
    furniture("диван").

    run() :-
        write("Длины отрезков ", 3, ", ", 4, ", ", 5),
        if check(3, 4, 5) then
            write(" удовлетворяют условию прямоугольного треугольника.\n")
        else
            write(" не удовлетворяют условию прямоугольного треугольника.\n")
        end if,
        write("Конец задания 2.\n\n"),
        fail.

    run() :-
        conformity(X, Y),
        writef("% — %.\n", X, Y),
        fail.

    run() :-
        write("Конец задания 5.").

end implement main

goal
    console::runUtf8(main::run).
