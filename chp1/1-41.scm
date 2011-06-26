; 1.41
(define (double x)
  (lambda (y)
    (x (x y))))

(define (inc x)
  (+ x 1))

(((double (double double)) inc) 5)