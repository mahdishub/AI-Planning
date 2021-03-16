(define (domain testDomain)
(:requirements :typing :adl :fluents :negative-preconditions :conditional-effects :equality :disjunctive-preconditions) 


(:types 
    intersection road vehicle - object
    intersection3 intersection4 - intersection
    rin3 rin4 - road 
)   

(:predicates 
	(rin4_1 ?int - intersection4 ?rin4 - rin4 ) (rin4_2 ?int - intersection4 ?rin4 -rin4 ) 
	(rin4_3 ?int - intersection4 ?rin4 - rin4) (rin4_4 ?int - intersection4 ?rin4 - rin4)
	(rout4_1 ?int - intersection4 ?rout4 - road) (rout4_2 ?int - intersection4 ?rout4 - road) 
	(rout4_3 ?int - intersection4 ?rout4 - road) (rout4_4  ?int - intersection4 ?rout4 - road)
	
    (partof_int ?int - intersection ?road - road) ; checking roads to be part of intersection
    (green_in_out ?rin - road ?rout - road) ;red light to go from rin to rout also describes pathing
    (vehicle_in_road ?vh - vehicle ?rin - road)
    (vehicle_int_in_out ?vh - vehicle ?int - intersection ?rin - road ?rout - road)
	
    (int4_cycle1) ( int4_cycle2) (int4_cycle3) (int4_cycle4)

    (out_of_domain ?road - road) ; to mark roads out of domain
    (drive);to start driving the cars

)

(:functions
    (capacity ?road-road)
    (vehicles_pass ?road-road)
    (vehicle_clock ?vh - vehicle) 
    (global_clock) 
    (plan_cost) 

)

(:action int4_start_cycle1
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1 ?rout2 - road
    )
    :precondition (and 
        (not (drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(rin4_1 ?int ?rin1) (rout4_2 ?int ?rout1)
		(rin4_3 ?int ?rin2) (rout4_4 ?int ?rout2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)

    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(assign (vehicles_pass ?rin1) 2)
		(assign (vehicles_pass ?rin2) 2)
		(int4_cycle1)
	)  
)


(:action int4_stop_cycle1
	:parameters (
		?int - intersection4
		?rin1 ?rin2 - rin4
		?rout1 ?rout2 - road
	)
	:precondition (and
		(int4_cycle1)
		(drive)
		(green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(rin4_1 ?int ?rin1) (rout4_2 ?int ?rout1)
		(rin4_3 ?int ?rin2) (rout4_4 ?int ?rout2)
		(partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)	
	)
	:effect (and 
		(not (drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(not (int4_cycle1))
		(assign (vehicles_pass ?rin1) 0)
		(assign (vehicles_pass ?rin2) 0)
	)
)



(:action int4_start_cycle2
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
    )
    :precondition (and 
        (not (drive))
		(not (green_in_out ?rin1 ?rout1_1)) (not (green_in_out ?rin1 ?rout1_2))
		(not (green_in_out ?rin2 ?rout2_1)) (not (green_in_out ?rin2 ?rout2_2))
		(rin4_1 ?int ?rin1) (rout4_3 ?int ?rout1_1) (rout4_4 ?int ?rout1_2)
		(rin4_3 ?int ?rin2) (rout4_1 ?int ?rout2_1) (rout4_2 ?int ?rout2_2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) 
		(partof_int ?int ?rout1_1) (partof_int ?int ?rout1_2)
		(partof_int ?int ?rout2_1) (partof_int ?int ?rout2_2)

    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1_1) (green_in_out ?rin1 ?rout1_2)
		(green_in_out ?rin2 ?rout2_1) (green_in_out ?rin2 ?rout2_2)
		(assign (vehicles_pass ?rin1) 3)
		(assign (vehicles_pass ?rin2) 3)
		(int4_cycle2)
	)  
)

(:action int4_stop_cycle2
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 - rin4
	?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
    )
    :precondition (and
		(drive)
		(int4_cycle2)
		(green_in_out ?rin1 ?rout1_1) (green_in_out ?rin1 ?rout1_2)
		(green_in_out ?rin2 ?rout2_1) (green_in_out ?rin2 ?rout2_2) 	
		(rin4_1 ?int ?rin1) (rout4_3 ?int ?rout1_1) (rout4_4 ?int ?rout1_2)
		(rin4_3 ?int ?rin2) (rout4_1 ?int ?rout2_1) (rout4_2 ?int ?rout2_2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) 
		(partof_int ?int ?rout1_1) (partof_int ?int ?rout1_2)
		(partof_int ?int ?rout2_1) (partof_int ?int ?rout2_2)
    )
    :effect (and 
		(not(drive))
		(not (green_in_out ?rin1 ?rout1_1)) (not (green_in_out ?rin1 ?rout1_2))
		(not (green_in_out ?rin2 ?rout2_1)) (not (green_in_out ?rin2 ?rout2_2))
		(not (int4_cycle2))
		(assign (vehicles_pass ?rin1) 0)
		(assign (vehicles_pass ?rin2) 0)
		(increase (global_clock) 1)
	)  
)



(:action int4_start_cycle3
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 -rin4
		?rout1 ?rout2 - road
    )
    :precondition (and 
        (not (drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(rin4_2 ?int ?rin1) (rout4_3 ?int ?rout1)
		(rin4_4 ?int ?rin2) (rout4_1 ?int ?rout2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)
		
    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(assign (vehicles_pass ?rin1) 2)
		(assign (vehicles_pass ?rin2) 2)
		(int4_cycle3)
	)  
)


(:action int4_stop_cycle3
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 -rin4
		?rout1 ?rout2 - road
    )
    :precondition (and
		(int4_cycle3) 
        (drive)
        (green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(rin4_2 ?int ?rin1) (rout4_3 ?int ?rout1)
		(rin4_4 ?int ?rin2) (rout4_1 ?int ?rout2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)	
    )
    :effect (and 
		(not(drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(not (int4_cycle3))
		(assign (vehicles_pass ?rin1) 0)
		(assign (vehicles_pass ?rin2) 0)
		(increase (global_clock) 1)
	)  
)




(:action int4_start_cycle4
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
    )
    :precondition (and 
        (not (drive))
		(not (green_in_out ?rin1 ?rout1_1)) (not (green_in_out ?rin1 ?rout1_2))
		(not (green_in_out ?rin2 ?rout2_1)) (not (green_in_out ?rin2 ?rout2_2))
		(rin4_2 ?int ?rin1) (rout4_4 ?int ?rout1_1) (rout4_1 ?int ?rout1_2)
		(rin4_4 ?int ?rin2) (rout4_2 ?int ?rout2_1) (rout4_3 ?int ?rout2_2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) 
		(partof_int ?int ?rout1_1) (partof_int ?int ?rout1_2)
		(partof_int ?int ?rout2_1) (partof_int ?int ?rout2_2)
	
    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1_1) (green_in_out ?rin1 ?rout1_2)
		(green_in_out ?rin2 ?rout2_1) (green_in_out ?rin2 ?rout2_2)
		(assign (vehicles_pass ?rin1) 3)
		(assign (vehicles_pass ?rin2) 3)
		(int4_cycle4)
	)  
)

(:action int4_stop_cycle4
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
    )
    :precondition (and 
        (int4_cycle4)
		(drive)
		(green_in_out ?rin1 ?rout1_1) (green_in_out ?rin1 ?rout1_2)
		(green_in_out ?rin2 ?rout2_1) (green_in_out ?rin2 ?rout2_2)
		(rin4_2 ?int ?rin1) (rout4_4 ?int ?rout1_1) (rout4_1 ?int ?rout1_2)
		(rin4_4 ?int ?rin2) (rout4_2 ?int ?rout2_1) (rout4_3 ?int ?rout2_2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) 
		(partof_int ?int ?rout1_1) (partof_int ?int ?rout1_2)
		(partof_int ?int ?rout2_1) (partof_int ?int ?rout2_2)	
    )
    :effect (and
		(not (int4_cycle4)) 
		(not (drive))
		(not (green_in_out ?rin1 ?rout1_1)) (not (green_in_out ?rin1 ?rout1_2))
		(not (green_in_out ?rin2 ?rout2_1)) (not (green_in_out ?rin2 ?rout2_2))
		(not (int4_cycle4))
		(assign (vehicles_pass ?rin1) 0)
		(assign (vehicles_pass ?rin2) 0)
		(increase (global_clock) 1)
	)  
)


(:action drive
	:parameters (
		?int - intersection
		?vh - vehicle
		?rin ?rout - road
	)
	:precondition (and
		(drive)
		(green_in_out ?rin ?rout)
		(vehicle_in_road ?vh ?rin)
		(vehicle_int_in_out ?vh ?int ?rin ?rout)
		(> (vehicles_pass ?rin) 0)
		(or
			(> (capacity ?rout) 0)
			(out_of_domain ?rout)
		)
	)
	:effect (and
		(not (vehicle_in_road ?vh ?rin))
		(vehicle_in_road ?vh ?rout)
		(decrease (vehicles_pass ?rin) 1)
		(when (not(out_of_domain ?rout))
		    (decrease (capacity ?rout) 1)
		)
		(increase (capacity ?rin) 1)
		(increase (plan_cost) (- (global_clock) (vehicle_clock ?vh) ) )
		(assign (vehicle_clock ?vh) (global_clock))
		
	)
)

)
