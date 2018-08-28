; Q1
(define (compose-all funcs)
  (define (func x) (compose-helper x funcs))
  (define (compose-helper x lst)
  	(if (null? lst) x
  		(compose-helper ((car lst) x) (cdr lst))))
  
  (lambda (y) (func y))
  )

; Q2
(define (tail-replicate x n)
  (define (tail-helper n lst)
  	(if (= n 0) lst
  		(tail-helper (- n 1) (cons x lst))))
  (tail-helper n nil)
)