#lang racket
(define (square x) (* x x))

(define (sqrt-iter old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
      new-guess
      (sqrt-iter new-guess (improve new-guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? old-guess new-guess)
  (< (/ (abs (-  new-guess old-guess)) new-guess) 0.000001))

(define (sqrt x)
  (sqrt-iter 0 1.0 x))