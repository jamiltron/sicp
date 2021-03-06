;;; SICP 1.18
;;; by Justin Hamilton
(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (peasant a b)
  (cond
   ((or (= a 0) (= b 0)) 0)
   (else (peasant-iter a b 0))))

(define (peasant-iter a b sum)
  (cond
   ((= b 1) (+ sum a))
   ((even? b) (peasant-iter (double a) (halve b) sum))
   (else (peasant-iter (double a) (halve (- b 1)) (+ sum a)))))