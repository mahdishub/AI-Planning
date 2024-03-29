(define (problem problem1) (:domain puzzle)
(:objects
    t1 t2 t3 t4 t5 t6 t7 t8 t9
    p1 p2 p3
)

(:init
    (tile t1) (tile t2) (tile t3) (tile t4)
    (tile t5) (tile t6) (tile t7) (tile t8)
    (position p1) (position p2) (position p3)
    (inc p1 p2) (inc p2 p3) (dec p2 p1) (dec p3 p2)  
    (at t4 p1 p1) (at t1 p1 p2) (at t3 p1 p3) 
    (at t2 p2 p1) (blank p2 p2) (at t5 p2 p3) 
    (at t6 p3 p1) (at t7 p3 p2) (at t8 p3 p3)
)

;init state
;413
;2-5
;678


(:goal (and
    (at t1 p1 p1) (at t2 p1 p2) (at t3 p1 p3) 
    (at t4 p2 p1) (at t5 p2 p3) 
    (at t6 p3 p1) (at t7 p3 p2) (at t8 p3 p3)
))

;goal state
;123
;4-5
;678

)
