(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner (term n) (accumulate combiner start (- n 1) term))
  )
)

(define (accumulate-tail combiner start n term)
  (define (accumulate-iter x result)
  	(if (= x 0)
  		result
  		(accumulate-iter (- x 1) (combiner (term x) result))
  		)

  	)
  (accumulate-iter (- n 1) (term n))
)

(define-macro (list-of expr for var in seq if filter-fn)
	(list 'map(list 'lambda (list var) expr) 
		(list 'filter(list 'lambda (list var) filter-fn) seq))

	)
  
