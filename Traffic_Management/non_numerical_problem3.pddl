(define (problem prob1) (:domain testDomain2)
(:objects 
    intA intB - intersection4
    r_ood1 r_ood2 r_ood3 r_ood4 r_ood5 r_ood6 - road
    r_a_4_1 r_a_4_2 r_a_4_3 r_a_4_4  - rin4
    r_b_4_1 r_b_4_2 r_b_4_3 r_b_4_4 - rin4
    v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15
    v16 v17 v18 v19 v20 v21 v22 v23 v24 v25 v26 v27 v28 v29 v30
    v31 v32 v33 v34 v35 v36 v37 v38 v39 v40 v41 v42 v43 v44 v45
    v46 v47 v48 v49 v50 v51 v52 v53 - vehicle

    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 n11 n12 n13 n14 n15 n16 n17 n18 - num
    
)

(:init
    
    (rin4_1 intA r_a_4_1) (rin4_1 intB r_b_4_1) 
    (rin4_2 intA r_a_4_2) (rin4_2 intB r_b_4_2)
    (rin4_3 intA r_a_4_3) (rin4_3 intB r_b_4_3)
    (rin4_4 intA r_a_4_4) (rin4_4 intB r_b_4_4)

    
    (rout4_1 intA r_ood2) (rout4_1 intB r_ood4)
    (rout4_2 intA r_ood1) (rout4_2 intB r_a_4_4) 
    (rout4_3 intA r_ood3) (rout4_3 intB r_ood5)
    (rout4_4 intA r_b_4_2) (rout4_4 intB r_ood6)

     


    ;; making roads of intersection a
    (partof_int intA r_a_4_1) (partof_int intA r_a_4_2)
    (partof_int intA r_a_4_3) (partof_int intA r_a_4_4)
    (partof_int intA r_ood1) (partof_int intA r_ood2)
    (partof_int intA r_ood3) (partof_int intA r_b_4_2)
    
    ;; making roads of intersection b
    (partof_int intB r_b_4_1) (partof_int intB r_b_4_2)
    (partof_int intB r_b_4_3) (partof_int intB r_b_4_4)
    (partof_int intB r_ood4) (partof_int intB r_ood5)
    (partof_int intB r_ood6) (partof_int intB r_a_4_4)
    
    ;; defining the red light paths of intersection a
    (not(green_in_out r_a_4_1 r_ood1)) (not(green_in_out r_a_4_1 r_ood3)) (not(green_in_out r_a_4_1 r_b_4_2))
    (not(green_in_out r_a_4_2 r_ood2)) (not(green_in_out r_a_4_2 r_b_4_2)) (not(green_in_out r_a_4_2 r_ood3))
    (not(green_in_out r_a_4_3 r_ood1)) (not(green_in_out r_a_4_3 r_ood2)) (not(green_in_out r_a_4_3 r_b_4_2))
    (not(green_in_out r_a_4_4 r_ood3)) (not(green_in_out r_a_4_4 r_ood1)) (not(green_in_out r_a_4_4 r_ood2))
	
    ;; defining red light paths of intersection b	
    (not(green_in_out r_b_4_1 r_ood6)) (not(green_in_out r_b_4_1 r_ood5)) (not(green_in_out r_b_4_1 r_a_4_4))
    (not(green_in_out r_b_4_2 r_ood4)) (not(green_in_out r_b_4_2 r_ood6)) (not(green_in_out r_b_4_2 r_ood5))
    (not(green_in_out r_b_4_3 r_a_4_4)) (not(green_in_out r_b_4_3 r_ood4)) (not(green_in_out r_b_4_3 r_ood6))
    (not(green_in_out r_b_4_4 r_ood5)) (not(green_in_out r_b_4_4 r_a_4_4)) (not(green_in_out r_b_4_4 r_ood4)) 
    
    
    ;; vehicle in road r_a_4_1
    (vehicle_in_road v1 r_a_4_1) (vehicle_in_road v2 r_a_4_1) (vehicle_in_road v3 r_a_4_1)
    (vehicle_in_road v4 r_a_4_1) (vehicle_in_road v5 r_a_4_1) (vehicle_in_road v6 r_a_4_1)
    (vehicle_in_road v7 r_a_4_1)
    
    ;;vehicle in r_a_4_3
    (vehicle_in_road v8 r_a_4_3) (vehicle_in_road v9 r_a_4_3) (vehicle_in_road v10 r_a_4_3)
    (vehicle_in_road v11 r_a_4_3) (vehicle_in_road v12 r_a_4_3) (vehicle_in_road v13 r_a_4_3)

    ;; vehicle in r_b_4_1
    (vehicle_in_road v14 r_b_4_1) (vehicle_in_road v15 r_b_4_1) (vehicle_in_road v16 r_b_4_1)
    (vehicle_in_road v17 r_b_4_1) (vehicle_in_road v18 r_b_4_1)

    ;;vehicle in r_b_4_3
    (vehicle_in_road v19 r_b_4_3) (vehicle_in_road v20 r_b_4_3) (vehicle_in_road v21 r_b_4_3)
    (vehicle_in_road v22 r_b_4_3) (vehicle_in_road v23 r_b_4_3) (vehicle_in_road v24 r_b_4_3)
    (vehicle_in_road v25 r_b_4_3) (vehicle_in_road v26 r_b_4_3) (vehicle_in_road v27 r_b_4_3)

    ;;vehicle in  r_a_4_2
    (vehicle_in_road v28 r_a_4_2) (vehicle_in_road v29 r_a_4_2) (vehicle_in_road v30 r_a_4_2)
    (vehicle_in_road v31 r_a_4_2) (vehicle_in_road v32 r_a_4_2) (vehicle_in_road v33 r_a_4_2) 
    (vehicle_in_road v34 r_a_4_2) (vehicle_in_road v35 r_a_4_2) (vehicle_in_road v36 r_a_4_2)

    ;;vehicle in r_a_4_4
    (vehicle_in_road v37 r_a_4_4) (vehicle_in_road v38 r_a_4_4) (vehicle_in_road v39 r_a_4_4)
    (vehicle_in_road v40 r_a_4_4) (vehicle_in_road v41 r_a_4_4) (vehicle_in_road v42 r_a_4_4)
    (vehicle_in_road v43 r_a_4_4)

    ;;vehicle in r_b_4_2
    (vehicle_in_road v44 r_b_4_2) (vehicle_in_road v45 r_b_4_2) (vehicle_in_road v46 r_b_4_2)
    (vehicle_in_road v47 r_b_4_2) 

    ;;vehicle in r_b_4_4
    (vehicle_in_road v48 r_b_4_4) (vehicle_in_road v49 r_b_4_4) (vehicle_in_road v50 r_b_4_4)
    (vehicle_in_road v51 r_b_4_4) (vehicle_in_road v52 r_b_4_4) (vehicle_in_road v53 r_b_4_4)
    
    ;; vehicle paths
    (vehicle_int_in_out v1 intA r_a_4_1 r_ood1)
    (vehicle_int_in_out v2 intA r_a_4_1 r_ood1)
    (vehicle_int_in_out v3 intA r_a_4_1 r_ood1)
    
    (vehicle_int_in_out v4 intA r_a_4_1 r_b_4_2)
    (vehicle_int_in_out v4 intB r_b_4_2 r_ood5)

    
    (vehicle_int_in_out v5 intA r_a_4_1 r_b_4_2)
    (vehicle_int_in_out v5 intB r_b_4_2 r_ood5)

    (vehicle_int_in_out v6 intA r_a_4_1 r_ood3)

    (vehicle_int_in_out v7 intA r_a_4_1 r_ood3)
    
    (vehicle_int_in_out v8 intA r_a_4_3 r_b_4_2)
    (vehicle_int_in_out v8 intB r_b_4_2 r_ood5)

    (vehicle_int_in_out v9 intA r_a_4_3 r_b_4_2)
    (vehicle_int_in_out v9 intB r_b_4_2 r_ood4)
    
    
    (vehicle_int_in_out v10 intA r_a_4_3 r_ood1)
    (vehicle_int_in_out v11 intA r_a_4_3 r_ood1)

    (vehicle_int_in_out v12 intA r_a_4_3 r_ood2)
    (vehicle_int_in_out v13 intA r_a_4_3 r_ood2)

    (vehicle_int_in_out v14 intB r_b_4_1 r_a_4_4)
    (vehicle_int_in_out v14 intA r_a_4_4 r_ood2)
	
    (vehicle_int_in_out v15 intB r_b_4_1 r_ood6)
    (vehicle_int_in_out v16 intB r_b_4_1 r_ood6)

    (vehicle_int_in_out v17 intB r_b_4_1 r_ood5)  
    (vehicle_int_in_out v18 intB r_b_4_1 r_ood5)

    (vehicle_int_in_out v19 intB r_b_4_3 r_ood6)
    (vehicle_int_in_out v20 intB r_b_4_3 r_ood6)
    (vehicle_int_in_out v21 intB r_b_4_3 r_ood6)

    (vehicle_int_in_out v22 intB r_b_4_3 r_ood4)
    (vehicle_int_in_out v23 intB r_b_4_3 r_ood4)
    (vehicle_int_in_out v24 intB r_b_4_3 r_ood4)

    (vehicle_int_in_out v25 intB r_b_4_3 r_a_4_4)
    (vehicle_int_in_out v25 intA r_a_4_4 r_ood2)

    (vehicle_int_in_out v26 intB r_b_4_3 r_a_4_4)
    (vehicle_int_in_out v26 intA r_a_4_4 r_ood2)

    (vehicle_int_in_out v27 intB r_b_4_3 r_a_4_4)
    (vehicle_int_in_out v27 intA r_a_4_4 r_ood3)

    (vehicle_int_in_out v28 intA r_a_4_2 r_ood3)
    (vehicle_int_in_out v29 intA r_a_4_2 r_ood3)
    (vehicle_int_in_out v30 intA r_a_4_2 r_ood3)

    (vehicle_int_in_out v31 intA r_a_4_2 r_ood2)
    (vehicle_int_in_out v32 intA r_a_4_2 r_ood2)
    (vehicle_int_in_out v33 intA r_a_4_2 r_ood2)

    (vehicle_int_in_out v34 intA r_a_4_2 r_b_4_2)
    (vehicle_int_in_out v34 intB r_b_4_2 r_ood6)
    
    (vehicle_int_in_out v35 intA r_a_4_2 r_b_4_2)
    (vehicle_int_in_out v35 intB r_b_4_2 r_ood6)

    (vehicle_int_in_out v36 intA r_a_4_2 r_b_4_2)
    (vehicle_int_in_out v36 intB r_b_4_2 r_ood6)

    (vehicle_int_in_out v37 intA r_a_4_4 r_ood3)
    (vehicle_int_in_out v38 intA r_a_4_4 r_ood3)
    (vehicle_int_in_out v39 intA r_a_4_4 r_ood3)

    (vehicle_int_in_out v40 intA r_a_4_4 r_ood1)
    (vehicle_int_in_out v41 intA r_a_4_4 r_ood1)
    (vehicle_int_in_out v42 intA r_a_4_4 r_ood1)
    (vehicle_int_in_out v43 intA r_a_4_4 r_ood1)

    (vehicle_int_in_out v44 intB r_b_4_2 r_ood4)
    (vehicle_int_in_out v45 intB r_b_4_2 r_ood4)
    (vehicle_int_in_out v46 intB r_b_4_2 r_ood4)
    
    (vehicle_int_in_out v47 intB r_b_4_2 r_ood6)

    (vehicle_int_in_out v48 intB r_b_4_4 r_ood4)
    (vehicle_int_in_out v49 intB r_b_4_4 r_ood4)

    (vehicle_int_in_out v50 intB r_b_4_4 r_ood5)
    (vehicle_int_in_out v51 intB r_b_4_4 r_ood5)

    (vehicle_int_in_out v52 intB r_b_4_4 r_a_4_4)
    (vehicle_int_in_out v52 intA r_a_4_4 r_ood3)

    (vehicle_int_in_out v53 intB r_b_4_4 r_a_4_4)
    (vehicle_int_in_out v53 intA r_a_4_4 r_ood2)
    
    ;; define numerical predicates
    (zero n0)
    (two n2)
    (three n3)
    ;;plus_one
    (plus_one n0 n1) (plus_one n1 n2)
    (plus_one n2 n3) (plus_one n3 n4)
    (plus_one n4 n5) (plus_one n5 n6) 
    (plus_one n6 n7) (plus_one n7 n8) 
    (plus_one n8 n9) (plus_one n9 n10)
    (plus_one n10 n11) (plus_one n11 n12)
    (plus_one n12 n13) (plus_one n13 n14)
    (plus_one n14 n15)

    ;;minus_one
    (minus_one n15 n14) (minus_one n14 n13) 
    (minus_one n13 n12) (minus_one n12 n11)
    (minus_one n11 n10)
    (minus_one n10 n9) (minus_one n9 n8)
    (minus_one n8 n7) (minus_one n7 n6)
    (minus_one n6 n5) (minus_one n5 n4)
    (minus_one n4 n3) (minus_one n3 n2)
    (minus_one n2 n1) (minus_one n1 n0)
    
    

    
    
    ;;define out of domain roads
    (out_of_domain r_ood1)
    (out_of_domain r_ood2)
    (out_of_domain r_ood3)
    (out_of_domain r_ood4)
    (out_of_domain r_ood5)
    (out_of_domain r_ood6)

    (not (drive))

    ;;road free spaces(capacity)
    (capacity r_a_4_1 n5)
    (capacity r_a_4_2 n3)
    (capacity r_a_4_3 n6)
    (capacity r_a_4_4 n3)
    (capacity r_b_4_1 n5)
    (capacity r_b_4_2 n0)
    (capacity r_b_4_3 n0)
    (capacity r_b_4_4 n4)
    (capacity r_ood1 n10)
    (capacity r_ood2 n10)
    (capacity r_ood3 n10)
    (capacity r_ood4 n10)
    (capacity r_ood5 n10)
    (capacity r_ood6 n10)
    
)


(:goal (and
       
    (vehicle_in_road v1 r_ood1)
    (vehicle_in_road v2 r_ood1)
    (vehicle_in_road v3 r_ood1)
    (vehicle_in_road v4 r_ood5)
    (vehicle_in_road v5 r_ood5)
    (vehicle_in_road v6 r_ood3)
    (vehicle_in_road v7 r_ood3)
    (vehicle_in_road v8 r_ood5)
    (vehicle_in_road v9 r_ood4)
    (vehicle_in_road v10 r_ood1)		
    (vehicle_in_road v11 r_ood1)
    (vehicle_in_road v12 r_ood2)
    (vehicle_in_road v13 r_ood2)
    (vehicle_in_road v14 r_ood2)
    (vehicle_in_road v15 r_ood6)
    (vehicle_in_road v16 r_ood6)
    (vehicle_in_road v17 r_ood5)
    (vehicle_in_road v18 r_ood5)
    (vehicle_in_road v19 r_ood6)
    (vehicle_in_road v20 r_ood6)
    (vehicle_in_road v21 r_ood6)
    (vehicle_in_road v22 r_ood4)
    (vehicle_in_road v23 r_ood4)
    (vehicle_in_road v24 r_ood4)
    (vehicle_in_road v25 r_ood2)
    (vehicle_in_road v26 r_ood2)
    (vehicle_in_road v27 r_ood3)
    (vehicle_in_road v28 r_ood3)
    (vehicle_in_road v29 r_ood3)
    (vehicle_in_road v30 r_ood3)
    (vehicle_in_road v31 r_ood2)
    (vehicle_in_road v32 r_ood2)
    (vehicle_in_road v33 r_ood2)
    (vehicle_in_road v34 r_ood6)
    (vehicle_in_road v35 r_ood6)
    (vehicle_in_road v36 r_ood6)
    (vehicle_in_road v37 r_ood3)
    (vehicle_in_road v38 r_ood3)
    (vehicle_in_road v39 r_ood3)
    (vehicle_in_road v40 r_ood1)
    

    )
)
(:metric minimize (total-cost))

)
