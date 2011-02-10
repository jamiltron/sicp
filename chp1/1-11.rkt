#lang racket
; iterative version
(define (f-iter n)
  (cond ((<= n 3) n)
        (else (+ (f-iter (- n 1)) 
                 (* 2 (f-iter (- n 2))) 
                 (* 3 (f-iter (- n 3)))))))

; recursive version
(define (f n)
  (cond ((<= n 3) n)
        (else (f-rec 1 2 3 3 n))))

(define (f-rec fn-1 fn-2 fn-3 last-calc end)
  (cond ((= last-calc end) fn-3)
        (else (f-rec fn-2 fn-3 (+ fn-3 (* 2 fn-2) (* 3 fn-1)) (+ last-calc 1) end))))
  
  