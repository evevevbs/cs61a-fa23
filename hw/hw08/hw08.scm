(define (ascending? s) 
        (if (or (null? s) (null? (cdr s))  )
            #t
            (if (>(car s) (car (cdr s)))
                #f
                (ascending? (cdr s))
            )
        )
)

(define (my-filter pred s) 
         (
            if (null? s)
               nil
               (
                if (pred (car s))
                    (cons (car s)(my-filter pred (cdr s)))
                    (my-filter pred (cdr s))
               )
         )
)

(define (interleave lst1 lst2) 
        (
            cond 
                ((null? lst1)lst2)
                ((null? lst2)lst1)
                
                (
                    else
                    (
                        cons(car lst1)(cons (car lst2) (interleave (cdr lst1 )(cdr lst2)))
                    )
                )
        )                    
)

(define (no-repeats s) 
    (
        cond
            ((or (null? s) (null? (cdr s)))s)
            (
                else(
                    if(null? (my-filter (lambda (x)(= x (car s)))(no-repeats (cdr s))))
                    (cons (car s)(no-repeats (cdr s)))
                    (no-repeats (cdr s))
                )
            )
    )
)

