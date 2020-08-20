(define (problem waiting-23) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
        P1 - plate
        P2 - plate
        C1 - customer
        C2 - customer
        LB - location
        UF - location
        MF - location
        LF - location
        MB - location
        UB - location
    )
    
    (:init
        (At Agent MF)
        (At P1 MB)
        (At P2 LB)
        (At C1 UB)
        (At C2 LF)
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
        (Served C1)
        (Served C2)
    
    ))
)
