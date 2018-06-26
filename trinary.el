(defconst trinary--true 1)
(defconst trinary--maybe 0)
(defconst trinary--false -1)

(defun trinary-print (value)
  (let ((x (trinary-value-value value)))
    (cond
     ((= x trinary--false) "F")
     ((= x trinary--maybe) "?")
     ((= x trinary--true) "T")))
  )

(trinary-true)
(trinary-maybe)
(trinary-false)

(defun trinary-true-p (value)
  (= trinary--true (trinary-value value)))

(defun trinary-maybe-p (value)
  (= trinary--maybe (trinary-value value)))

(defun trinary-false-p (value)
  (= trinary--false (trinary-value value)))

(trinary-true-p (trinary-maybe))
(trinary-maybe-p (trinary-maybe))
(trinary-false-p (trinary-maybe))

(trinary-add-maybe (trinary-true))

(defun trinary-add-maybe (value)
  (cond
   ((trinary-true-p value)
    (trinary-true))
   ((trinary-maybe-p value)
    (trinary-maybe))
   ((trinary-false-p value)
    (trinary-maybe))))

(defstruct (trinary
            (:print-function 'trinary-print)
            (:constructor nil)
            (:constructor trinary-true (&aux (value trinary--true)))
            (:constructor trinary-maybe (&aux (value trinary--maybe)))
            (:constructor trinary-false (&aux (value trinary--false))))
  value)


(message (make-trinary-value :value 1))
