(defpackage :clml.association-rule
  (:nicknames :assoc :association-rule)
  (:use :cl
        :hjs.util.vector
        :hjs.learn.read-data)
  (:export :association-analyze
           :%association-analyze
           :%association-analyze-apriori
           :%association-analyze-da
           :%association-analyze-ap-genrule
           :%association-analyze-da-ap-genrule
           :%association-analyze-fp-growth
           :%association-analyze-eclat
           :%association-analyze-lcm
           :assoc-result-rules
           :assoc-result-header
           :association-rule
           :scan-eclat
           :scan-input-data-eclat
           :%association-analyze-eclat
           
           )
  (:documentation "Package for association rule analysis
*** sample usage
#+INCLUDE: \"../sample/association-analyze.org\" example lisp"))