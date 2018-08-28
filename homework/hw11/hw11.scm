(define (find s predicate)
  (cond 
  	((null? s) #f)
  	((predicate (car s)) (car s))
  	(else (find (cdr-stream s) predicate)))
)

(define (scale-stream s k)
  (if (null? s) nil
  	(cons-stream (* k (car s)) (scale-stream (cdr-stream s) k))
  	)
)

(define (contain? lst a)
	(cond
		((null? lst) #f)
		((eq? (car lst) a) #t)
		(else (contain? (cdr lst) a))
		)
	)

(define (has-cycle s)
	(define (cycle? seen current)
	  (cond 
	  	((null? current) #f)
	  	((contain? seen current) #t)
	  	(else (cycle? (cons current seen) (cdr-stream current)))
	  	)
	  )
	(cycle? nil s)
)
(define (has-cycle-constant s)
  'YOUR-CODE-HERE
)
