(define (domain waiting)
    (:requirements :adl )
    
    (:types
        waiter
        location
        plate 
        customer
        brokenplate
        broom
        rubbish
       
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
        (Holding ?a - waiter ?o - object)
        ;; Example:
        ;; (Contains ?x - object ?c - container)
    )
    
    ;;;; Action Template - Delete and fill in own actions ;;;;
    
    (:action PICKUPPLATE
        :parameters (?x - location ?p - plate ?b - broom)
        :precondition (and (not (Holding Agent ?b)) (At Agent ?x) (At ?p ?x) (not (= ?x ?p)) (not (= ?p ?b)))
        :effect (and (Holding Agent ?p) (not (At ?p ?x)))
    )
    
     (:action PICKUPBROOM
        :parameters (?x - location ?p - plate ?b - broom)
        :precondition (and (not (Holding Agent ?p)) (At Agent ?x) (At ?b ?x) (not (= ?x ?p)) (not (= ?p ?b)))
        :effect (and (Holding Agent ?b) (not (At ?b ?x)))
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
        :precondition (and (At Agent ?from) (AdjacentTo ?from ?to) (not (exists (?bp - brokenplate) (At ?bp ?to))) (not (= ?from ?to)))
        :effect (and (At Agent ?to) (not (At Agent ?from)))
    )
    
    (:action SweepRubbish
        :parameters (?x - location ?y - location ?b - broom ?r - rubbish)
        :precondition (and (Holding Agent ?b) (At Agent ?x) (At ?r ?y) (AdjacentTo ?x ?y) (not (= ?x ?y)) (not (= ?y ?b)) (not (= ?b ?r)))
        :effect (not (At ?r ?y))
    )
    
    (:action SweepShards
        :parameters (?x - location ?y - location ?b - broom ?bp - brokenplate)
        :precondition (and (Holding Agent ?b) (At Agent ?x) (At ?bp ?y) (AdjacentTo ?x ?y) (not (= ?x ?y)) (not (= ?y ?b)) (not (= ?b ?bp)))
        :effect (not (At ?bp ?y))
    )
    
    (:action putDown
        :parameters (?x - location ?o - object)
        :precondition (and (Holding Agent ?o) (At Agent ?x) (not (= ?o ?x)))
        :effect (and (not (Holding Agent ?o)) (At ?o ?x))
    
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
