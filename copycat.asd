;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(asdf:defsystem #:copycat
  :description "Hofstadter's Copycat in modern Common Lisp"
  :depends-on ()
  :serial t
  :components
  ((:file "packages")
   (:file "lucid-util")
   (:file "flavors")
   (:file "specials")
   (:file "util")
   (:file "constants")))
