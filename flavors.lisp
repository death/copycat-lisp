;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(in-package #:copycat)

;; Compatibility package for FLAVORS use in Copycat.

(defmacro defflavor (name (&rest slots) (&rest super) &rest props)
  (let ((slot-defs
          (loop with no-initform = (gensym)
                for slot-spec in slots
                for slot-name = (etypecase slot-spec
                                  (symbol slot-spec)
                                  (cons (car slot-spec)))
                for slot-initform = (if (consp slot-spec)
                                        (cadr slot-spec)
                                        no-initform)
                for has-reader = (member :gettable-instance-variables props)
                for has-writer = (member :settable-instance-variables props)
                for has-initarg = (member :initable-instance-variables props)
                for slot-fun-name = (when (or has-reader has-writer)
                                      (append-symbols name '- slot-name))
                collect (append (list slot-name)
                                (cond ((and has-reader has-writer)
                                       (list :accessor slot-fun-name))
                                      (has-reader
                                       (list :reader slot-fun-name))
                                      (has-writer
                                       (list :writer `(setf ,slot-fun-name))))
                                (when has-initarg
                                  (list :initarg (keywordize slot-name)))
                                (when (not (eq no-initform slot-initform))
                                  (list :initform slot-initform))))))
    `(eval-when (:compile-toplevel :load-toplevel :execute)
       (sb-mop:finalize-inheritance
        (defclass ,name (,@super)
          ,slot-defs)))))

(defgeneric receive (self method-name &rest method-args))

(defmacro defmethod ((class-name method-name) (&rest params) &body forms)
  (let ((slot-names (mapcar #'sb-mop:slot-definition-name (sb-mop:class-slots (find-class class-name)))))
    `(cl:defmethod receive ((self ,class-name) (method-name (eql ',method-name)) &rest method-args)
       (destructuring-bind ,params method-args
         (with-slots ,slot-names self
           ,@forms)))))

(defun send (receiver method-name &rest method-args)
  (apply #'receive receiver method-name method-args))
