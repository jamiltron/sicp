; 1.34
(define (f g)
  (g 2))

(define (square x) (* x x))

; (f f) produces an error:
; (f f) -> (f (f 2)), 2 is not a procedure, which is what is
; expected. (f 2) -> (2 2), which is invalid.