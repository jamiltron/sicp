; 1.31
(define (identity x) x)

(define (inc x) (+ x 1))

(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial-rec n)
  (product-rec identity 1 inc n))

(define (factorial-iter n)
  (product-iter identity 1 inc n))

; this would be better if I used the actual product notation for
; the Wallis product (i.e. ( * (/ (* 2 n) (- (* 2 n) 1))
;                              (/ (* 2 n) (+ (* 2 n) 1)))
; but I felt this would be cheating
(define (wallis-product n)
  (define (numer-term k)
    (* (quotient (+ k 2) 2) 2.0))
  (define (denom-term k)
    (+ (* (quotient (+ k 1) 2) 2.0) 1))
  (* 4.0
     (/ (product-iter numer-term 1 inc n) 
        (product-iter denom-term 1 inc n))))
    
       