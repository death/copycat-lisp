;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(in-package #:copycat)

;; Compatibility package for FLAVORS use in Copycat.

(defun keywordize (symbol)
  (intern (symbol-name symbol) :keyword))

(defun symbolicate (&rest parts)
  (intern (apply #'concatenate 'string (mapcar #'string parts))))

(defmacro defflavor (name (&rest slots) (&rest super) &rest props)
  (let ((slot-defs
          (loop for slot-name in slots
                for has-reader = (member :gettable-instance-variables props)
                for has-writer = (member :settable-instance-variables props)
                for has-initarg = (member :initable-instance-variables props)
                for slot-fun-name = (when (or has-reader has-writer)
                                      (symbolicate name '- slot-name))
                collect (append (list slot-name)
                                (cond ((and has-reader has-writer)
                                       (list :accessor slot-fun-name))
                                      (has-reader
                                       (list :reader slot-fun-name))
                                      (has-writer
                                       (list :writer `(setf ,slot-fun-name))))
                                (when has-initarg
                                  (list :initarg (keywordize slot-name)))))))
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
