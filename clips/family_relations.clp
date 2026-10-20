(deftemplate relations
( multislot fact  ) 
)
(deffacts facts
   (relations (fact Ahmed is the father of Mohammed) )
   (relations (fact Mona is the mother of Ali) )
   (relations (fact Sara is the mother of Mohammed) )
   (relations (fact Ali is the father of Sara) )
   (relations (fact Hassan is the father of Ahmed) )
)
( defrule father_mother(or (relations (fact ?x is the father of ?y) ) (relations (fact ?x is the mother of ?y) ) )
 =>
(printout t ?x " is a Parent" crlf))

( defrule grandparentfather (and (relations (fact ?x1 is the father of ?y1) ) (or (relations (fact ?y1 is the father of ?z) ) (relations (fact ?y1 is the mother of ?z) ) ) )
 =>
(printout t ?x1 " is a GrandFather" crlf))

( defrule grandparentmother (and (relations (fact ?x2 is the mother of ?y2) ) (or (relations (fact ?y2 is the mother of ?z2) )  (relations (fact ?y2 is the father of ?z2) ) ) )
 =>
(printout t ?x2 " is The GrandMother" crlf))
