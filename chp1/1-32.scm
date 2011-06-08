; 1.32
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (add x y)
  (+ x y))

(define (mul x y)
  (* x y))

(define (identity x) x)

(define (inc x) (+ x 1))

(define (sum term a next b)
  (accumulate add 0 term a next b))

(define (product term a next b)
  (accumulate mul 1 term a next b))