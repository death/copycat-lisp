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
   (:file "preutils")
   (:file "flavors")
   (:file "specials")
   (:file "util")
   (:file "constants")
   (:file "workspace")
   (:file "workspace-structures")
   (:file "workspace-strings")))
