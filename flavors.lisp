;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(in-package #:copycat)

;; Compatibility package for FLAVORS use in Copycat.

(defgeneric receive (self method-name &rest method-args))

(defmacro defmethod ((class-name method-name) (&rest params) &body forms)
  (let ((slot-names (mapcar #'sb-mop:slot-definition-name (sb-mop:class-slots (find-class class-name)))))
    `(cl:defmethod receive ((self ,class-name) (method-name (eql ',method-name)) &rest method-args)
       (destructuring-bind ,params method-args
         (with-slots ,slot-names self
           ,@forms)))))

(defun send (receiver method-name &rest method-args)
  (apply #'receive receiver method-name method-args))

(defmacro defflavor (name (&rest slots) (&rest super) &rest props)
  (let* ((getter-methods '())
         (setter-methods '())
         (slot-defs
           (loop with no-initform = (gensym)
                 for slot-spec in slots
                 for slot-name = (etypecase slot-spec
                                   (symbol slot-spec)
                                   (cons (car slot-spec)))
                 for slot-initform = (if (consp slot-spec)
                                         (cadr slot-spec)
                                         no-initform)
                 for has-getter = (member :gettable-instance-variables props)
                 for has-setter = (member :settable-instance-variables props)
                 for has-initarg = (member :initable-instance-variables props)
                 collect (append (list slot-name)
                                 (when has-initarg
                                   (list :initarg (keywordize slot-name)))
                                 (when (not (eq no-initform slot-initform))
                                   (list :initform slot-initform)))
                 do (when has-getter
                      (let ((getter-name (keywordize slot-name)))
                        (push `(defmethod (,name ,getter-name) () ,slot-name) getter-methods)))
                    (when has-setter
                      (let ((setter-name (keywordize (append-symbols 'set- slot-name))))
                        (push `(defmethod (,name ,setter-name) (new-value) (setq ,slot-name new-value)) setter-methods))))))
    `(eval-when (:compile-toplevel :load-toplevel :execute)
       (sb-mop:finalize-inheritance
        (defclass ,name (,@super)
          ,slot-defs))
       ,@getter-methods
       ,@setter-methods)))
