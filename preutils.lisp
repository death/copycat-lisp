;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(in-package #:copycat)

(defun keywordize (symbol)
  (intern (symbol-name symbol) :keyword))

(defun append-symbols (&rest parts)
  (intern (apply #'concatenate 'string (mapcar #'string parts))))

(defun string-append (&rest string-designators)
  (apply #'concatenate 'string (mapcar #'string string-designators)))

(defun memq (item list)
  (member item list))
