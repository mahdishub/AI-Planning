(define (domain logistics)

    (:requirements :strips :typing )
    
    (:types
        city place physobj - object
        vehicles package   - physobj
        truck airplane     - vehicles
        airport location   - place
    )
    
    (:predicates
        (in_city ?loc - place ?city - city )
        (at ?obj - physobj ?loc - place )
        (in ?obj - physobj ?veh - vehicles )
    )
    
    (:action load_truck
        :parameters ( ?truck - truck ?pkg - package ?loc - place  )
        :precondition (and ( at ?pkg ?loc ) ( at ?truck ?loc ) )
        :effect (and (not( at ?pkg ?loc )) ( in ?pkg ?truck ) )
    )
    
    (:action unload_truck
        :parameters ( ?truck - truck ?pkg - package ?loc - place  )
        :precondition (and ( in ?pkg ?truck ) ( at ?truck ?loc ) )
        :effect (and (not( in ?pkg ?truck )) ( at ?pkg ?loc ) )
    )
    
    (:action load_airplane
        :parameters ( ?plane - airplane ?loc - place ?pkg - package )
        :precondition (and ( at ?pkg ?loc ) ( at ?plane ?loc ) )
        :effect (and
            ( in ?pkg ?plane )
            (not (at ?pkg ?loc))
        )
    )
    
    (:action unload_airplane
        :parameters ( ?plane - airplane ?loc - place ?pkg - package )
        :precondition (and ( in ?pkg ?plane ) (at ?plane ?loc ) )
        :effect (and
            (at ?pkg ?loc )
            (not (in ?pkg ?plane))
        )
    )
    
    (:action drive_truck
        :parameters (?truck - truck ?loc_from - place  ?loc_to - place ?city - city )
        :precondition (and ( at ?truck ?loc_from ) (in_city ?loc_to ?city ) (in_city ?loc_from ?city ) )
        :effect (and
            (at ?truck ?loc_to )
            (not (at ?truck ?loc_from) )
        )
    )
    (:action fly_airplane
        :parameters (?plane - airplane ?loc_from - airport ?loc_to - airport )
        :precondition (and (at ?plane ?loc_from ) )
        :effect (and
            (at ?plane ?loc_to)
            (not (at ?plane ?loc_from))
        )
    )
    
)