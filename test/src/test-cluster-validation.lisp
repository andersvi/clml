
(in-package :clml.test)


(define-test test-sample-cluster-validation
  (let (*workspace*)
    (assert (setf *workspace*
                       (clml.hjs.k-means:k-means
                        5
                        (clml.hjs.read-data:pick-and-specialize-data
                         (clml.hjs.read-data:read-data-from-file
                          (clml.utility.data:fetch "https://mmaul.github.io/clml.data/sample/syobu.csv")
                          :type :csv
                          :csv-type-spec '(string integer integer integer integer)
                          :external-format #+lispworks :sjis #+allegro :932 #+sbcl :sjis #+ccl :Windows-31j)
                         :except '(0) :data-types (make-list 4
                                                             :initial-element :numeric))
                        :random-state
			#+lispworks *random-state*
                        #-lispworks (clml.hjs.k-means:make-random-state-with-seed 0))))
    (print (list (calinski) 441.62300853729414))
    (assert-true (epsilon> (calinski)
			   441.8562453167574d0 ))
    (print (list (hartigan) (ball-and-hall) (dunn-index :distance :euclid
                                       :intercluster :hausdorff
                                                    :intracluster :centroid)
                 (davies-bouldin-index :distance :euclid
                                                 :intercluster :average
                                       :intracluster :complete)
                 (global-silhouette-value :distance :euclid)
                 ))
    (assert-true (epsilon> (hartigan)
                           2.5074656538807005d0
			   ))
    (assert-true (epsilon> (ball-and-hall)
			   1127.7702976190476d0
			   ))
    (assert-true (epsilon> (dunn-index :distance :euclid
                                       :intercluster :hausdorff
                                       :intracluster :centroid)
			   1.2576613811360222d0
			   ))
    (assert-true (epsilon> (davies-bouldin-index :distance :euclid
                                                 :intercluster :average
                                                 :intracluster :complete)
                           1.899415427296523d0
			   ))
    (assert-true (epsilon> (global-silhouette-value :distance :euclid)
                           0.5786560352400679d0
			   ))))
