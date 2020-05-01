;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(in-package #:copycat)

;; Compatibility package for FLAVORS use in Copycat.

(defmacro defflavor (name (&rest slots) (&rest super) &rest props)
  (error "TODO"))

(defmacro defmethod ((class-name method-name) (&rest params) &body forms)
  (error "TODO"))

(defun send (receiver method-name &rest method-args)
  (error "TODO"))
