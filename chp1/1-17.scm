(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (new-* a b)
  (cond
   ((= b 0) 0)
   ((even? b) (new-* (double a) (halve b)))
   (else (+ a (new-* a (- b 1))))))
