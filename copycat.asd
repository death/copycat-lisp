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
   (:file "workspace-strings")
   (:file "workspace-objects")
   (:file "initialization")
   (:file "run")
   (:file "slipnet-def")
   (:file "slipnet-links")
   (:file "slipnet-functions")
   ;; (:file "slipnet-graphics")
   (:file "descriptions")
   (:file "bonds")
   (:file "groups")
   (:file "concept-mappings")
   (:file "correspondences")
   (:file "replacements")
   (:file "breakers")
   (:file "coderack")
   (:file "rule")
   (:file "answer")
   (:file "workspace-object-formulas")
   (:file "workspace-structure-formulas")
   ;; (:file "formulas")
   ;; (:file "graphics-util")
   ;; (:file "coderack-graphics")
   ;; (:file "letter-graphics")
   ;; (:file "description-graphics")
   ;; (:file "bond-graphics")
   ;; (:file "group-graphics")
   ;; (:file "correspondence-graphics")
   ;; (:file "replacement-graphics")
   ;; (:file "rule-graphics")
   ;; (:file "workspace-graphics")
   ;; (:file "temperature-graphics")
   ;; (:file "ccat-bar-graph")
   ;; (:file "ccat-menu")
   ;; (:file "copystat")
   ))
