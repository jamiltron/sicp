; 1.36
(define tolerance 0.00001)

(define (average x y) (/ (+ x y) 2))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
      (try next))))
  (try first-guess))

(display "without damping: ")
(newline)
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)
(display "with damping: ")
(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0)