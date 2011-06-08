; 1.29
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (inc x)
  (+ x 1))

(define (simpsons f a b n)
  (define h (/ (- b a n)))
  (define (get-coeff k n)
    (cond
      ((or (= 0 k) (= n k))
       1)
      ((even? k) 2)
      (else 4)))
  (define (y k)
    (f (+ a (* k h))))
  (define (term k)
    (* (get-coeff k n) (y k)))
  (* (/ h 3) (sum term 0 inc n)))
  