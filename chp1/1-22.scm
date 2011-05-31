(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
         (report-prime (- (runtime) start-time)))
        (else
         #f)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes min)
  (search-for-primes-iter min 0 3 (runtime)))

(define (search-for-primes-iter num found target start-time)
  (cond
    ((>= found target) (report-prime (- (runtime) start-time)))
    ((even? num) (search-for-primes-iter (+ 1 num) found target start-time))
    (else
     (cond
       ((timed-prime-test num) (search-for-primes-iter (+ 2 num) (+ found 1) target start-time))
       (else
        (search-for-primes-iter (+ 2 num) found target start-time))))))