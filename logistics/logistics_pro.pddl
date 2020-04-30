(define (problem pb_logistics)
        (:domain logistics)
        
    (:objects 
        pkg1 pkg2    - package
        plane        - airplane
        truck       -  truck
        london paris - city
        p_north p_south - location
        p_airport l_airport - airport
    )
    
    (:init
        (in_city p_north paris)
        (in_city p_south paris)
        (in_city p_airport paris)
        (in_city l_airport london)
        (at pkg1 l_airport)
        (at pkg2 l_airport)
        (at truck p_airport)
        (at plane l_airport)
    )
    
    (:goal
        (and (at pkg1 p_north) (at pkg2 p_south) )
    )

)
