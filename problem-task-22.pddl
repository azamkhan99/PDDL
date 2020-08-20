(define (problem waiting-22) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
        P - plate
        C - customer
        LB - location
        UF - location
        MF - location
        LF - location
        MB - location
        UB - location
        
    )
    
    (:init
        (At Agent BUFF)
        (At P BUFF)
        (At C LB)
        (AdjacentTo BUFF UF)
        (AdjacentTo UF BUFF)
        (AdjacentTo MF UF)
        (AdjacentTo UF MF)
        (AdjacentTo MF LF)
        (AdjacentTo LF MF)
        (AdjacentTo LB LF)
        (AdjacentTo LF LB)
        (AdjacentTo MB LB)
        (AdjacentTo LB MB)
        (AdjacentTo UB MB)
        (AdjacentTo MB UB)
        (AdjacentTo UF UB)
        (AdjacentTo UB UF)
    )
    
    (:goal (and
        (Served C)
    
    ))
)
