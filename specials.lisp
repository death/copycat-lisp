;;;; +----------------------------------------------------------------+
;;;; | Copycat                                                        |
;;;; +----------------------------------------------------------------+

(in-package #:copycat)

(defvar %verbose%)
(defvar %slightly-verbose%)
(defvar %workspace-graphics%)
(defvar %coderack-graphics%)
(defvar %minimal-coderack-graphics%)
(defvar %temperature-graphics%)
(defvar %slipnet-graphics%)
(defvar %slipnet-display-level%)
(defvar %description-graphics%)
(defvar %demo-graphics%)
(defvar %graphics-rate%)

(defvar %slipnet-font%)
(defvar %slipnet-activation-font%)
(defvar %slipnet-letter-font%)

(defvar %workspace-font%)
(defvar %group-font%)
(defvar %relevant-length-font%)
(defvar %irrelevant-length-font%)
(defvar %rule-font%)
(defvar %relevant-concept-mapping-font%)
(defvar %irrelevant-concept-mapping-font%)
(defvar %relevant-description-font%)
(defvar %irrelevant-description-font%)
(defvar %temperature-font%)

(defvar %coderack-font%)
(defvar %minimal-coderack-font%)
(defvar %codelet-name-font%)
(defvar %codelet-group-font%)

(defvar %codelet-name-font-height%)
(defvar %group-font-height%)
(defvar %slipnet-font-height%)
(defvar %slipnet-activation-font-height%)
(defvar %relevant-concept-mapping-font-height%)

(defvar %codelet-types%)
(defvar %codelet-short-names%)

(defvar %built%)

(defvar %max-coderack-size%)
(defvar %num-of-urgency-bins%)
(defvar %urgency-value-array%)

(defvar %max-activation%)
(defvar %workspace-activation%)
(defvar %full-activation-threshold%)
(defvar %time-step-length%)
(defvar %initial-slipnode-clamp-time%)

(defvar %very-low-answer-temperature-threshold-distribution%)
(defvar %low-answer-temperature-threshold-distribution%)
(defvar %medium-answer-temperature-threshold-distribution%)
(defvar %high-answer-temperature-threshold-distribution%)
(defvar %very-high-answer-temperature-threshold-distribution%)

(defvar *initial-string*)
(defvar *modified-string*)
(defvar *answer-string*)
(defvar *target-string*)

(defvar plato-a)
(defvar plato-b)
(defvar plato-c)
(defvar plato-d)
(defvar plato-e)
(defvar plato-f)
(defvar plato-g)
(defvar plato-h)
(defvar plato-i)
(defvar plato-j)
(defvar plato-k)
(defvar plato-l)
(defvar plato-m)
(defvar plato-n)
(defvar plato-o)
(defvar plato-p)
(defvar plato-q)
(defvar plato-r)
(defvar plato-s)
(defvar plato-t)
(defvar plato-u)
(defvar plato-v)
(defvar plato-w)
(defvar plato-x)
(defvar plato-y)
(defvar plato-z)

(defvar *slipnet-letters*)

(defvar plato-one)
(defvar plato-two)
(defvar plato-three)
(defvar plato-four)
(defvar plato-five)

(defvar *slipnet-numbers*)

(defvar plato-leftmost)
(defvar plato-rightmost)
(defvar plato-middle)
(defvar plato-single)
(defvar plato-whole)

(defvar plato-first)
(defvar plato-last)

(defvar plato-left)
(defvar plato-right)

(defvar plato-predecessor)
(defvar plato-successor)
(defvar plato-sameness)

(defvar plato-predgrp)
(defvar plato-succgrp)
(defvar plato-samegrp)

(defvar plato-identity)
(defvar plato-opposite)

(defvar plato-letter)
(defvar plato-group)

(defvar plato-letter-category)
(defvar plato-string-position-category)
(defvar plato-alphabetic-position-category)
(defvar plato-direction-category)
(defvar plato-bond-category)
(defvar plato-group-category)
(defvar plato-length)
(defvar plato-object-category)
(defvar plato-bond-facet)

(defvar *slipnet*)

(defvar *initially-clamped-slipnodes*)

(defvar *slipnet-initialized*)
