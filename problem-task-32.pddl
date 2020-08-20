(define (problem waiting-32) ;; Replace XX with task number
    (:domain waiting)
    (:objects 
        P - plate
        C - customer
        B - broom
        BP - brokenplate
        R - rubbish
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
        (At B UB)
        (At BP MF)
        (AT BP MB)
        (AT R UF)
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
        (At Agent BUFF)
        (not (At BP MF))
        (not (At BP MB))
        (not (At R UF))
    
    ))
)
