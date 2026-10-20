(deffunction calculate_factorial(?X)
(bind ?temp 1)
(loop-for-count (?i 1 ?X) do
(bind ?temp (* ?temp ?i))
)
(return ?temp)
)
(defrule factorials
=>
(printout t crlf crlf "Enter the numer you want the factorial : ")
(bind ?N (read))
(printout t "the factorial of the number is   =" (calculate_factorial ?N) crlf)
)