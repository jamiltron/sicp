; 1.43
(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f x)
  (define (iter f comp x)
    (cond
     ((= x 0)
      comp)
     (else (iter f (compose f comp) (- x 1)))))
  (iter f f (- x 1)))

      