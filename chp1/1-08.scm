#lang racket
(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? old-guess new-guess)
  (< (/ (abs (- new-guess old-guess)) new-guess) 0.001))

(define (cube-iter old-guess new-guess x)
  (if (good-enough? old-guess new-guess)
      new-guess
      (cube-iter new-guess (improve new-guess x) x)))

(define (cube-root x)
  (cube-iter 0 1 x))