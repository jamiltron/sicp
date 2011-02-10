#lang racket
(define (square x)
  (* x x))

(define (fast-exp b n)
  (cond ((= n 0) 1)
        ((= n 1) b)
        (else (fast-exp-iter b n 1))))

(define (fast-exp-iter b n a)
  (cond ((= n 0) a)
        ((odd? n) (fast-exp-iter b (- n 1) (* b a)))
        (else (fast-exp-iter (square b) (/ n 2) a))))