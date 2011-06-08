; 1.33
(define (filtered-accumulate combiner null-value term a next b filter)
  (cond
    ((> a b)
     null-value)
    ((filter a)
     (combiner (term a)
               (filtered-accumulate combiner null-value term (next a) next b filter)))
    (else
     (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond
    ((> (square test-divisor) n) n)
    ((divides? test-divisor n) test-divisor)
    (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (if (= n 1)
      #f
      (= (smallest-divisor n) n)))

(define (add x y) (+ x y))

(define (inc x) (+ x 1))

(define (sum-of-prime-squares a b)
  (filtered-accumulate add 0 square a inc b prime?))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)

(define (mul x y) (* x y))

(define (part-b n)
  (define (rel-prime i)
    (= (gcd i n) 1))
  (filtered-accumulate mul 1 identity 1 inc (- n 1) rel-prime))
