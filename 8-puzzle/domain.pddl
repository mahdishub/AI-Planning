(define (domain puzzle)

(:requirements :strips )



(:predicates 
    (tile ?t1) (position ?p1)
    (at ?t1 ?x ?y) (blank ?x ?y)
    (inc ?x1 ?x2) (dec ?x1 ?x2 )
)


(:action up
    :parameters (?t ?x ?y ?by)
    :precondition (and
        (tile ?t) (position ?x) (position ?y) (position ?by)
        (at ?t ?x ?y) (blank ?x ?by) (dec ?y ?by)
    )
    :effect (and
        (not (at ?t ?x ?y)) (not (blank ?x ?by))
        (at ?t ?x ?by) (blank ?x ?y) 
    )
)

(:action down
    :parameters (?t ?x ?y ?by)
    :precondition (and 
        (tile ?t) (position ?x) (position ?y) (position ?by)
        (at ?t ?x ?y) (blank ?x ?by) (inc ?y ?by)
    )
    :effect (and
        (not (at ?t ?x ?y)) (not (blank ?x ?by))
        (at ?t ?x ?by) (blank ?x ?y) 
    )
)

(:action right
    :parameters (?t ?x ?y ?bx)
    :precondition (and 
        (tile ?t) (position ?x) (position ?y) (position ?bx)
        (at ?t ?x ?y) (blank ?bx ?y) (inc ?x ?bx)
    )
    :effect (and
        (not (at ?t ?x ?y)) (not (blank ?bx ?y))
        (at ?t ?bx ?y) (blank ?x ?y) 
    )
)

(:action left
    :parameters (?t ?x ?y ?bx)
    :precondition (and 
        (tile ?t) (position ?x) (position ?y) (position ?bx)
        (at ?t ?x ?y) (blank ?bx ?y) (dec ?x ?bx)
    )
    :effect (and
        (not (at ?t ?x ?y)) (not (blank ?bx ?y))
        (at ?t ?bx ?y) (blank ?x ?y) 
    )
)



)