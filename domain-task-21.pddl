(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        plate 
        customer
        ;; Fill in additional types here
    )
    
    (:constants 
        ;; You should not need to add any additional constants
        Agent - waiter
        BUFF - location
    )
    
    (:predicates
        (At ?o - object ?x - location)
        (HasFood ?p - plate)
        (Served ?c - customer)
        (AdjacentTo ?f - location ?t - location)
        (Location ?x - location)
        (Holding ?a - waiter ?p - plate)
        ;; Example:
        ;; (Contains ?x - object ?c - container)
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    (:action PICKUP
        :parameters (?x - location ?p - plate)
        :precondition (and (not (Holding Agent ?p)) (At Agent ?x) (At ?p ?x) (not (= ?x ?p)))
        :effect (and (Holding Agent ?p) (not (At ?p ?x)))
    )
    
    (:action HANDOVER
        :parameters (?p - plate ?c - customer ?x - location)
        :precondition (and (At Agent ?x) (At ?c ?x) (not (Served ?c)) (HasFood ?p) (Holding Agent ?p) (not (= ?p ?c)) (not (= ?c ?x)))
        :effect (and (Served ?c) (not (Holding Agent ?p)))
    )
    
    (:action FILL
        :parameters (?p - plate)
        :precondition (and (At Agent BUFF) (Holding Agent ?p) (not (HasFood ?p)))
        :effect (HasFood ?p)
    )
    
    (:action MOVE
        :parameters (?from - location ?to - location)
        :precondition (and (At Agent ?from) (AdjacentTo ?from ?to) (not (= ?from ?to)))
        :effect (and (At Agent ?to) (not (At Agent ?from)))
    )
    
    
    ;(:action dummy-action
    ;    :parameters (?obj - object)
    ;    :precondition (and
    ;        (dummy-pred-1 ?obj)
    ;        (dummy-pred-2 ?obj)
    ;    )
    ;    :effect (and
    ;        (not (dummy-pred-1 ?obj))
    ;        (dummy-pred-3 ?obj)
    ;    )
    ;)
)
