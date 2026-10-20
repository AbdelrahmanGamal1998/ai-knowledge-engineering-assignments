(deftemplate data
	(slot name)
	(slot age)
	(slot weight)
	(slot height)
	(multislot blood-pressure))
(deffacts data
(data (name "Andrew") (age 20) (weight 80) 
	(height 188) (blood-pressure 130 80))

(data (name "brenda") (age 23) (weight 50) 
	(height  140) (blood-pressure 120 60))

(data (name "cyril") (age 63) (weight 70) 
	(height  1678) (blood-pressure 180 90)))

(defrule rule
(data (name ?name-var) (age ?age-var) (weight ?weight-var) (height ?height-var))
=>
(printout t "My Name is  " ?name-var ", age : " ?age-var ", weight : " ?weight-var ", and my height :" ?height-var crlf))

