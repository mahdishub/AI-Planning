(define (domain testDomain2)
(:requirements :typing :adl :negative-preconditions :action-costs :conditional-effects :equality :disjunctive-preconditions) 


(:types 
    intersection road vehicle num - object
    intersection3 intersection4 - intersection
    rin3 rin4 - road 
)   

(:predicates 
	(rin4_1 ?int - intersection4 ?rin4 - rin4 ) (rin4_2 ?int - intersection4 ?rin4 - rin4 ) 
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
	(vehicles_pass ?rin - road ?n1 - num)
	(plus_one ?n1 ?n2 - num)
	(minus_one ?n1 ?n2 - num)
	(capacity ?road - road ?n1 - num)
	(two ?num - num)
	(zero ?num - num)
	(three ?num - num)
)

(:functions 
    (total-cost)
	 
)

(:action int4_start_cycle1
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1 ?rout2 - road
		?two - num
    )
    :precondition (and 
        (not (drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(rin4_1 ?int ?rin1) (rout4_2 ?int ?rout1)
		(rin4_3 ?int ?rin2) (rout4_4 ?int ?rout2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)
		(two ?two)
    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(vehicles_pass ?rin1 ?two) ;; assigning vehicle pass 2
		(vehicles_pass ?rin2 ?two) ;; assigning vehicle pass 2
		(int4_cycle1)
		(increase (total-cost) 1)
	)  
)


(:action int4_stop_cycle1
	:parameters (
		?int - intersection4
		?rin1 ?rin2 - rin4
		?rout1 ?rout2 - road
		?zero ?vprin1 ?vprin2 - num
	)
	:precondition (and
		(int4_cycle1)
		(drive)
		(green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(rin4_1 ?int ?rin1) (rout4_2 ?int ?rout1)
		(rin4_3 ?int ?rin2) (rout4_4 ?int ?rout2)
		(partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)
		(vehicles_pass ?rin1 ?vprin1)
		(vehicles_pass ?rin2 ?vprin2)	
	)
	:effect (and 
		(not (drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(not (int4_cycle1))
		(not (vehicles_pass ?rin1 ?vprin1))
		(not (vehicles_pass ?rin2  ?vprin2))
		(increase (total-cost) 1)
	)
)



(:action int4_start_cycle2
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
		?three - num
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
		(three ?three)

    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1_1) (green_in_out ?rin1 ?rout1_2)
		(green_in_out ?rin2 ?rout2_1) (green_in_out ?rin2 ?rout2_2)
		(vehicles_pass ?rin1 ?three)
		(vehicles_pass ?rin2 ?three)
		(int4_cycle2)
		(increase (total-cost) 1)
	)  
)

(:action int4_stop_cycle2
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
		?zero ?vprin1 ?vprin2 - num
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
		(vehicles_pass ?rin1 ?vprin1)
		(vehicles_pass ?rin2 ?vprin2)
    )
    :effect (and 
		(not(drive))
		(not (green_in_out ?rin1 ?rout1_1)) (not (green_in_out ?rin1 ?rout1_2))
		(not (green_in_out ?rin2 ?rout2_1)) (not (green_in_out ?rin2 ?rout2_2))
		(not (int4_cycle2))
		(not (vehicles_pass ?rin1 ?vprin1))
		(not (vehicles_pass ?rin2  ?vprin2))
		(increase (total-cost) 1)
	)  
)



(:action int4_start_cycle3
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 - rin4
		?rout1 ?rout2 - road
		?two - num
    )
    :precondition (and 
        (not (drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(rin4_2 ?int ?rin1) (rout4_3 ?int ?rout1)
		(rin4_4 ?int ?rin2) (rout4_1 ?int ?rout2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)
		(two ?two)
		
    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(vehicles_pass ?rin1 ?two)
		(vehicles_pass ?rin2 ?two)
		(int4_cycle3)
		(increase (total-cost) 1)
	)  
)


(:action int4_stop_cycle3
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 - rin4
		?rout1 ?rout2 - road
		?zero ?vprin1 ?vprin2 - num
    )
    :precondition (and
		(int4_cycle3) 
        (drive)
        (green_in_out ?rin1 ?rout1) (green_in_out ?rin2 ?rout2)
		(rin4_2 ?int ?rin1) (rout4_3 ?int ?rout1)
		(rin4_4 ?int ?rin2) (rout4_1 ?int ?rout2)
        (partof_int ?int ?rin1) (partof_int ?int ?rin2) (partof_int ?int ?rout1) (partof_int ?int ?rout2)
		(vehicles_pass ?rin1 ?vprin1)
		(vehicles_pass ?rin2 ?vprin2)	
    )
    :effect (and 
		(not(drive))
		(not (green_in_out ?rin1 ?rout1)) (not (green_in_out ?rin2 ?rout2))
		(not (int4_cycle3))
		(not (vehicles_pass ?rin1 ?vprin1))
		(not (vehicles_pass ?rin2 ?vprin2))
		(increase (total-cost) 1)
	)  
)




(:action int4_start_cycle4
    :parameters (
        ?int - intersection4
        ?rin1  ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
		?three - num
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
		(three ?three)
	
    )
    :effect (and 
		(drive)
		(green_in_out ?rin1 ?rout1_1) (green_in_out ?rin1 ?rout1_2)
		(green_in_out ?rin2 ?rout2_1) (green_in_out ?rin2 ?rout2_2)
		(vehicles_pass ?rin1 ?three) ;; asigning 3
		(vehicles_pass ?rin2 ?three)
		(int4_cycle4)
		(increase (total-cost) 1)
	)  
)

(:action int4_stop_cycle4
    :parameters (
        ?int - intersection4
        ?rin1 ?rin2 - rin4
		?rout1_1 ?rout1_2 ?rout2_1 ?rout2_2 - road
		?vprin1 ?vprin2 - num
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
		(vehicles_pass ?rin1 ?vprin1)
		(vehicles_pass ?rin2 ?vprin2)	
    )
    :effect (and
		(not (int4_cycle4)) 
		(not (drive))
		(not (green_in_out ?rin1 ?rout1_1)) (not (green_in_out ?rin1 ?rout1_2))
		(not (green_in_out ?rin2 ?rout2_1)) (not (green_in_out ?rin2 ?rout2_2))
		(not (int4_cycle4))
		(not (vehicles_pass ?rin1 ?vprin1))
		(not (vehicles_pass ?rin2 ?vprin2))
		(increase (total-cost) 1)
	)  
)


(:action drive
	:parameters (
		?int - intersection
		?vh - vehicle
		?rin ?rout - road
		?vp_n1 ?vp_n2 ?cpi_n1 ?cpi_n2 ?cpo_n1 ?cpo_n2 - num
		
	)
	:precondition (and
		(drive)
		(green_in_out ?rin ?rout)
		(vehicle_in_road ?vh ?rin)
		(vehicle_int_in_out ?vh ?int ?rin ?rout)
		(vehicles_pass ?rin ?vp_n1)
		(minus_one ?vp_n1 ?vp_n2)
		(capacity ?rout ?cpo_n1)
		(minus_one ?cpo_n1 ?cpo_n2)
		(capacity ?rin ?cpi_n1)
		(plus_one ?cpi_n1 ?cpi_n2)
		(not (zero ?vp_n1)) ; vehicles_pass is not zero
		(or
			(not (zero ?cpo_n1))
			(out_of_domain ?rout)
		)
	)
	:effect (and
		(not (vehicle_in_road ?vh ?rin))
		(vehicle_in_road ?vh ?rout)
		;;decreasing vehicle pass by 1
		(not (vehicles_pass ?rin ?vp_n1))
		(vehicles_pass ?rin ?vp_n2)
		
		;;decreasing capacity of rout by 1
		(when (not(out_of_domain ?rout))
		    (and
		    	(not (capacity ?rout ?cpo_n1))
				(capacity ?rout ?cpo_n2)
		    )
		)

		;;increasing capacity of rin by 1
		(not (capacity ?rin ?cpi_n1))
		(capacity ?rin ?cpi_n2)
		(increase (total-cost) 1)
	)
)





)
