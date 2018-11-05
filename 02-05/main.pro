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

clauses
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
        write("Конец задания 5.").

end implement main

goal
    console::runUtf8(main::run).
