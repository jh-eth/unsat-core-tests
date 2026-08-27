(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-26 13:56:57
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/viper_function_unused_precondition_by_parameter_type/fp_func_map_inhale.vpr
; Verifier id: 00
; ------------------------------------------------------------
; Begin preamble
; ////////// Static preamble
; 
; ; /z3config.smt2
(set-option :print-success true) ; Boogie: false
(set-option :global-decls true) ; Necessary for push pop mode
(set-option :auto_config false)
(set-option :smt.case_split 3)
(set-option :smt.delay_units true)
(set-option :type_check true)
(set-option :smt.mbqi false)
(set-option :pp.bv_literals false)
(set-option :smt.qi.eager_threshold 100)
(set-option :smt.arith.solver 2)
(set-option :model.v2 true)
(set-option :smt.qi.max_multi_patterns 1000)
; 
; ; /preamble.smt2
(declare-datatypes (($Snap 0)) ((
    ($Snap.unit)
    ($Snap.combine ($Snap.first $Snap) ($Snap.second $Snap)))))
(declare-sort $Ref 0)
(declare-const $Ref.null $Ref)
(declare-sort $FPM 0)
(declare-sort $PPM 0)
(define-sort $Perm () Real)
(define-const $Perm.Write $Perm 1.0)
(define-const $Perm.No $Perm 0.0)
(define-fun $Perm.isValidVar ((p $Perm)) Bool
	(<= $Perm.No p))
(define-fun $Perm.isReadVar ((p $Perm)) Bool
    (and ($Perm.isValidVar p)
         (not (= p $Perm.No))))
(define-fun $Perm.min ((p1 $Perm) (p2 $Perm)) Real
    (ite (<= p1 p2) p1 p2))
(define-fun $Math.min ((a Int) (b Int)) Int
    (ite (<= a b) a b))
(define-fun $Math.clip ((a Int)) Int
    (ite (< a 0) 0 a))
; ////////// Sorts
(declare-sort Set<Int> 0)
(declare-sort Map<Int~_Int> 0)
; ////////// Sort wrappers
; Declaring additional sort wrappers
(declare-fun $SortWrappers.IntTo$Snap (Int) $Snap)
(declare-fun $SortWrappers.$SnapToInt ($Snap) Int)
(assert (forall ((x Int)) (!
    (= x ($SortWrappers.$SnapToInt($SortWrappers.IntTo$Snap x)))
    :pattern (($SortWrappers.IntTo$Snap x))
    :qid |$Snap.$SnapToIntTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.IntTo$Snap($SortWrappers.$SnapToInt x)))
    :pattern (($SortWrappers.$SnapToInt x))
    :qid |$Snap.IntTo$SnapToInt|
    )))
(declare-fun $SortWrappers.BoolTo$Snap (Bool) $Snap)
(declare-fun $SortWrappers.$SnapToBool ($Snap) Bool)
(assert (forall ((x Bool)) (!
    (= x ($SortWrappers.$SnapToBool($SortWrappers.BoolTo$Snap x)))
    :pattern (($SortWrappers.BoolTo$Snap x))
    :qid |$Snap.$SnapToBoolTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.BoolTo$Snap($SortWrappers.$SnapToBool x)))
    :pattern (($SortWrappers.$SnapToBool x))
    :qid |$Snap.BoolTo$SnapToBool|
    )))
(declare-fun $SortWrappers.$RefTo$Snap ($Ref) $Snap)
(declare-fun $SortWrappers.$SnapTo$Ref ($Snap) $Ref)
(assert (forall ((x $Ref)) (!
    (= x ($SortWrappers.$SnapTo$Ref($SortWrappers.$RefTo$Snap x)))
    :pattern (($SortWrappers.$RefTo$Snap x))
    :qid |$Snap.$SnapTo$RefTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$RefTo$Snap($SortWrappers.$SnapTo$Ref x)))
    :pattern (($SortWrappers.$SnapTo$Ref x))
    :qid |$Snap.$RefTo$SnapTo$Ref|
    )))
(declare-fun $SortWrappers.$PermTo$Snap ($Perm) $Snap)
(declare-fun $SortWrappers.$SnapTo$Perm ($Snap) $Perm)
(assert (forall ((x $Perm)) (!
    (= x ($SortWrappers.$SnapTo$Perm($SortWrappers.$PermTo$Snap x)))
    :pattern (($SortWrappers.$PermTo$Snap x))
    :qid |$Snap.$SnapTo$PermTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.$PermTo$Snap($SortWrappers.$SnapTo$Perm x)))
    :pattern (($SortWrappers.$SnapTo$Perm x))
    :qid |$Snap.$PermTo$SnapTo$Perm|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Set<Int>To$Snap (Set<Int>) $Snap)
(declare-fun $SortWrappers.$SnapToSet<Int> ($Snap) Set<Int>)
(assert (forall ((x Set<Int>)) (!
    (= x ($SortWrappers.$SnapToSet<Int>($SortWrappers.Set<Int>To$Snap x)))
    :pattern (($SortWrappers.Set<Int>To$Snap x))
    :qid |$Snap.$SnapToSet<Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Set<Int>To$Snap($SortWrappers.$SnapToSet<Int> x)))
    :pattern (($SortWrappers.$SnapToSet<Int> x))
    :qid |$Snap.Set<Int>To$SnapToSet<Int>|
    )))
; Declaring additional sort wrappers
(declare-fun $SortWrappers.Map<Int~_Int>To$Snap (Map<Int~_Int>) $Snap)
(declare-fun $SortWrappers.$SnapToMap<Int~_Int> ($Snap) Map<Int~_Int>)
(assert (forall ((x Map<Int~_Int>)) (!
    (= x ($SortWrappers.$SnapToMap<Int~_Int>($SortWrappers.Map<Int~_Int>To$Snap x)))
    :pattern (($SortWrappers.Map<Int~_Int>To$Snap x))
    :qid |$Snap.$SnapToMap<Int~_Int>To$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.Map<Int~_Int>To$Snap($SortWrappers.$SnapToMap<Int~_Int> x)))
    :pattern (($SortWrappers.$SnapToMap<Int~_Int> x))
    :qid |$Snap.Map<Int~_Int>To$SnapToMap<Int~_Int>|
    )))
; ////////// Symbols
(declare-fun Set_card (Set<Int>) Int)
(declare-const Set_empty Set<Int>)
(declare-fun Set_in (Int Set<Int>) Bool)
(declare-fun Set_singleton (Int) Set<Int>)
(declare-fun Set_unionone (Set<Int> Int) Set<Int>)
(declare-fun Set_union (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_intersection (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_difference (Set<Int> Set<Int>) Set<Int>)
(declare-fun Set_subset (Set<Int> Set<Int>) Bool)
(declare-fun Set_equal (Set<Int> Set<Int>) Bool)
(declare-fun Set_skolem_diff (Set<Int> Set<Int>) Int)
(declare-fun Map_apply (Map<Int~_Int> Int) Int)
(declare-fun Map_card (Map<Int~_Int>) Int)
(declare-fun Map_disjoint (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_domain (Map<Int~_Int>) Set<Int>)
(declare-const Map_empty Map<Int~_Int>)
(declare-fun Map_equal (Map<Int~_Int> Map<Int~_Int>) Bool)
(declare-fun Map_update (Map<Int~_Int> Int Int) Map<Int~_Int>)
(declare-fun Map_values (Map<Int~_Int>) Set<Int>)
(declare-fun Map_range_domain_skolem (Map<Int~_Int> Int) Int)
; Declaring symbols related to program functions (from program analysis)
(declare-fun unused_map_inhale ($Snap Map<Int~_Int>) Bool)
(declare-fun unused_map_inhale%limited ($Snap Map<Int~_Int>) Bool)
(declare-fun unused_map_inhale%stateless (Map<Int~_Int>) Bool)
(declare-fun unused_map_inhale%precondition ($Snap Map<Int~_Int>) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
(assert (! (forall ((s Set<Int>)) (!
  (<= 0 (Set_card s))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.Set_card_nonneg|)) :named prover_0))
(assert (! (forall ((o Int)) (!
  (not (Set_in o (as Set_empty  Set<Int>)))
  :pattern ((Set_in o (as Set_empty  Set<Int>)))
  :qid |$Set[Int]_prog.Set_empty_contains_nothing|)) :named prover_1))
(assert (! (forall ((s Set<Int>)) (!
  (and
    (=> (= (Set_card s) 0) (= s (as Set_empty  Set<Int>)))
    (=> (not (= (Set_card s) 0)) (exists ((x Int))  (Set_in x s))))
  :pattern ((Set_card s))
  :qid |$Set[Int]_prog.Set_card_zero|)) :named prover_2))
(assert (! (forall ((r Int)) (!
  (Set_in r (Set_singleton r))
  :pattern ((Set_singleton r))
  :qid |$Set[Int]_prog.Set_singleton_contains1|)) :named prover_3))
(assert (! (forall ((r Int) (o Int)) (!
  (= (Set_in o (Set_singleton r)) (= r o))
  :pattern ((Set_in o (Set_singleton r)))
  :qid |$Set[Int]_prog.Set_singleton_contains2|)) :named prover_4))
(assert (! (forall ((r Int)) (!
  (= (Set_card (Set_singleton r)) 1)
  :pattern ((Set_card (Set_singleton r)))
  :qid |$Set[Int]_prog.Set_singleton_card|)) :named prover_5))
(assert (! (forall ((a Set<Int>) (x Int) (o Int)) (!
  (= (Set_in o (Set_unionone a x)) (or (= o x) (Set_in o a)))
  :pattern ((Set_in o (Set_unionone a x)))
  :qid |$Set[Int]_prog.Set_unionone_contains1|)) :named prover_6))
(assert (! (forall ((a Set<Int>) (x Int)) (!
  (Set_in x (Set_unionone a x))
  :pattern ((Set_unionone a x))
  :qid |$Set[Int]_prog.Set_unionone_contains2|)) :named prover_7))
(assert (! (forall ((a Set<Int>) (x Int) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_unionone a x)))
  :pattern ((Set_unionone a x) (Set_in y a))
  :qid |$Set[Int]_prog.Set_unionone_contains3|)) :named prover_8))
(assert (! (forall ((a Set<Int>) (x Int)) (!
  (=> (Set_in x a) (= (Set_card (Set_unionone a x)) (Set_card a)))
  :pattern ((Set_card (Set_unionone a x)))
  :qid |$Set[Int]_prog.Set_unionone_card1|)) :named prover_9))
(assert (! (forall ((a Set<Int>) (x Int)) (!
  (=> (not (Set_in x a)) (= (Set_card (Set_unionone a x)) (+ (Set_card a) 1)))
  :pattern ((Set_card (Set_unionone a x)))
  :qid |$Set[Int]_prog.Set_unionone_card2|)) :named prover_10))
(assert (! (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_union a b)) (or (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_union a b)))
  :qid |$Set[Int]_prog.Set_union_contains1|)) :named prover_11))
(assert (! (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y a) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y a))
  :qid |$Set[Int]_prog.Set_union_contains2|)) :named prover_12))
(assert (! (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (Set_in y (Set_union a b)))
  :pattern ((Set_union a b) (Set_in y b))
  :qid |$Set[Int]_prog.Set_union_contains3|)) :named prover_13))
(assert (! (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_intersection a b)) (and (Set_in o a) (Set_in o b)))
  :pattern ((Set_in o (Set_intersection a b)))
  :pattern ((Set_intersection a b) (Set_in o a))
  :pattern ((Set_intersection a b) (Set_in o b))
  :qid |$Set[Int]_prog.Set_intersection_contains|)) :named prover_14))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union (Set_union a b) b) (Set_union a b))
  :pattern ((Set_union (Set_union a b) b))
  :qid |$Set[Int]_prog.Set_union_absorb1|)) :named prover_15))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_union a (Set_union a b)) (Set_union a b))
  :pattern ((Set_union a (Set_union a b)))
  :qid |$Set[Int]_prog.Set_union_absorb2|)) :named prover_16))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection (Set_intersection a b) b) (Set_intersection a b))
  :pattern ((Set_intersection (Set_intersection a b) b))
  :qid |$Set[Int]_prog.Set_intersection_absorb1|)) :named prover_17))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (= (Set_intersection a (Set_intersection a b)) (Set_intersection a b))
  :pattern ((Set_intersection a (Set_intersection a b)))
  :qid |$Set[Int]_prog.Set_intersection_absorb2|)) :named prover_18))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (+ (Set_card (Set_union a b)) (Set_card (Set_intersection a b)))
    (+ (Set_card a) (Set_card b)))
  :pattern ((Set_card (Set_union a b)))
  :pattern ((Set_card (Set_intersection a b)))
  :qid |$Set[Int]_prog.Set_card_union_intersection|)) :named prover_19))
(assert (! (forall ((a Set<Int>) (b Set<Int>) (o Int)) (!
  (= (Set_in o (Set_difference a b)) (and (Set_in o a) (not (Set_in o b))))
  :pattern ((Set_in o (Set_difference a b)))
  :pattern ((Set_difference a b) (Set_in o a))
  :qid |$Set[Int]_prog.Set_diff_contains1|)) :named prover_20))
(assert (! (forall ((a Set<Int>) (b Set<Int>) (y Int)) (!
  (=> (Set_in y b) (not (Set_in y (Set_difference a b))))
  :pattern ((Set_difference a b) (Set_in y b))
  :qid |$Set[Int]_prog.Set_diff_contains2|)) :named prover_21))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (and
    (=
      (+
        (+ (Set_card (Set_difference a b)) (Set_card (Set_difference b a)))
        (Set_card (Set_intersection a b)))
      (Set_card (Set_union a b)))
    (=
      (Set_card (Set_difference a b))
      (- (Set_card a) (Set_card (Set_intersection a b)))))
  :pattern ((Set_card (Set_difference a b)))
  :qid |$Set[Int]_prog.Set_diff_card|)) :named prover_22))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (=
    (Set_subset a b)
    (forall ((o Int)) (!
      (=> (Set_in o a) (Set_in o b))
      :pattern ((Set_in o a))
      :pattern ((Set_in o b))
      )))
  :pattern ((Set_subset a b))
  :qid |$Set[Int]_prog.Set_subset_def|)) :named prover_23))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (or
    (and (Set_equal a b) (= a b))
    (and
      (not (Set_equal a b))
      (and
        (not (= a b))
        (and
          (= (Set_skolem_diff a b) (Set_skolem_diff b a))
          (not
            (= (Set_in (Set_skolem_diff a b) a) (Set_in (Set_skolem_diff a b) b)))))))
  :pattern ((Set_equal a b))
  :qid |$Set[Int]_prog.Set_equal_def|)) :named prover_24))
(assert (! (forall ((a Set<Int>) (b Set<Int>)) (!
  (=> (Set_equal a b) (= a b))
  :pattern ((Set_equal a b))
  :qid |$Set[Int]_prog.Set_equal_ext|)) :named prover_25))
(assert (! (forall ((m Map<Int~_Int>)) (!
  (<= 0 (Map_card m))
  :pattern ((Map_card m))
  :qid |$Map[Int,Int]_prog.Map_card_nonneg|)) :named prover_26))
(assert (! (forall ((m Map<Int~_Int>)) (!
  (= (Set_card (Map_domain m)) (Map_card m))
  :pattern ((Set_card (Map_domain m)))
  :pattern ((Map_card m))
  :qid |$Map[Int,Int]_prog.Map_domain_card|)) :named prover_27))
(assert (! (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (Map_disjoint m1 m2)
    (forall ((k Int)) (!
      (or (not (Set_in k (Map_domain m1))) (not (Set_in k (Map_domain m2))))
      :pattern ((Set_in k (Map_domain m1)))
      :pattern ((Set_in k (Map_domain m2)))
      )))
  :pattern ((Map_disjoint m1 m2))
  :qid |$Map[Int,Int]_prog.Map_disjoint_def1|)) :named prover_28))
(assert (! (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (not (Map_disjoint m1 m2))
    (exists ((k Int)) 
      (and (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))))
  :pattern ((Map_disjoint m1 m2))
  :qid |$Map[Int,Int]_prog.Map_disjoint_def2|)) :named prover_29))
(assert (! (forall ((k Int)) (!
  (not (Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  :pattern ((Set_in k (Map_domain (as Map_empty  Map<Int~_Int>))))
  :qid |$Map[Int,Int]_prog.Map_empty_domain|)) :named prover_30))
(assert (! (forall ((m Map<Int~_Int>)) (!
  (and
    (= (= (Map_card m) 0) (= m (as Map_empty  Map<Int~_Int>)))
    (and
      (=> (not (= (Map_card m) 0)) (exists ((u Int))  (Set_in u (Map_domain m))))
      (forall ((u Int)) (!
        (=> (Set_in u (Map_domain m)) (not (= (Map_card m) 0)))
        :pattern ((Set_in u (Map_domain m)))
        ))))
  :pattern ((Map_card m))
  :qid |$Map[Int,Int]_prog.Map_card_zero|)) :named prover_31))
(assert (! (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=>
    (and
      (forall ((k Int)) (!
        (= (Set_in k (Map_domain m1)) (Set_in k (Map_domain m2)))
        :pattern ((Set_in k (Map_domain m1)))
        :pattern ((Set_in k (Map_domain m2)))
        ))
      (forall ((k Int)) (!
        (=> (Set_in k (Map_domain m1)) (= (Map_apply m1 k) (Map_apply m2 k)))
        :pattern ((Map_apply m1 k))
        :pattern ((Map_apply m2 k))
        )))
    (Map_equal m1 m2))
  :pattern ((Map_equal m1 m2))
  :qid |$Map[Int,Int]_prog.Map_equal_def|)) :named prover_32))
(assert (! (forall ((m1 Map<Int~_Int>) (m2 Map<Int~_Int>)) (!
  (=> (Map_equal m1 m2) (= m1 m2))
  :pattern ((Map_equal m1 m2))
  :qid |$Map[Int,Int]_prog.Map_equal_ext|)) :named prover_33))
(assert (! (forall ((m Map<Int~_Int>) (k1 Int) (k2 Int) (v Int)) (!
  (and
    (=>
      (= k1 k2)
      (and
        (Set_in k2 (Map_domain (Map_update m k1 v)))
        (= (Map_apply (Map_update m k1 v) k2) v)))
    (=>
      (not (= k1 k2))
      (and
        (=
          (Set_in k2 (Map_domain (Map_update m k1 v)))
          (Set_in k2 (Map_domain m)))
        (=>
          (Set_in k2 (Map_domain m))
          (= (Map_apply (Map_update m k1 v) k2) (Map_apply m k2))))))
  :pattern ((Set_in k2 (Map_domain (Map_update m k1 v))))
  :pattern ((Set_in k2 (Map_domain m)) (Map_update m k1 v))
  :pattern ((Map_apply (Map_update m k1 v) k2))
  :qid |$Map[Int,Int]_prog.Map_update_domain|)) :named prover_34))
(assert (! (forall ((m Map<Int~_Int>) (k Int) (v Int)) (!
  (and
    (=> (Set_in k (Map_domain m)) (= (Map_card (Map_update m k v)) (Map_card m)))
    (=>
      (not (Set_in k (Map_domain m)))
      (= (Map_card (Map_update m k v)) (+ (Map_card m) 1))))
  :pattern ((Map_card (Map_update m k v)))
  :pattern ((Map_card m) (Map_update m k v))
  :qid |$Map[Int,Int]_prog.Map_update_card|)) :named prover_35))
(assert (! (forall ((m Map<Int~_Int>) (v Int)) (!
  (=>
    (Set_in v (Map_values m))
    (and
      (Set_in (Map_range_domain_skolem m v) (Map_domain m))
      (= v (Map_apply m (Map_range_domain_skolem m v)))))
  :pattern ((Set_in v (Map_values m)))
  :qid |$Map[Int,Int]_prog.Map_values_contains|)) :named prover_36))
(assert (! (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (> (Set_card (Map_values m)) 0))
  :pattern ((Map_apply m k))
  :pattern ((Set_in k (Map_domain m)))
  :qid |$Map[Int,Int]_prog.Map_values_nonempty|)) :named prover_37))
(assert (! (forall ((m Map<Int~_Int>) (k Int)) (!
  (=> (Set_in k (Map_domain m)) (Set_in (Map_apply m k) (Map_values m)))
  :pattern ((Map_apply m k))
  :qid |$Map[Int,Int]_prog.Map_values_contains|)) :named prover_38))
; End preamble
; ------------------------------------------------------------
; State saturation: after preamble
(set-option :rlimit 1000000)
(check-sat)
; unknown
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; Declaring symbols related to program functions (from verification)
(assert (! (forall ((s@$ $Snap) (m@0@00 Map<Int~_Int>)) (!
  (= (unused_map_inhale%limited s@$ m@0@00) (unused_map_inhale s@$ m@0@00))
  :pattern ((unused_map_inhale s@$ m@0@00))
  :qid |quant-u-0|)) :named axiom_13))
(assert (! (forall ((s@$ $Snap) (m@0@00 Map<Int~_Int>)) (!
  (unused_map_inhale%stateless m@0@00)
  :pattern ((unused_map_inhale%limited s@$ m@0@00))
  :qid |quant-u-1|)) :named axiom_14))
(assert (! (forall ((s@$ $Snap) (m@0@00 Map<Int~_Int>)) (!
  (=>
    (unused_map_inhale%precondition s@$ m@0@00)
    (= (unused_map_inhale s@$ m@0@00) true))
  :pattern ((unused_map_inhale s@$ m@0@00))
  :qid |quant-u-2|)) :named axiom_15))
(assert (! (forall ((s@$ $Snap) (m@0@00 Map<Int~_Int>)) (!
  true
  :pattern ((unused_map_inhale s@$ m@0@00))
  :qid |quant-u-3|)) :named axiom_16))
; End function- and predicate-related preamble
; ------------------------------------------------------------
; ---------- caller ----------
(set-option :rlimit 0)
(push) ; 1
; State saturation: after contract
(set-option :rlimit 500000)
(check-sat)
; unknown
(set-option :rlimit 0)
(push) ; 2
(pop) ; 2
(push) ; 2
; [exec]
; var m: Map[Int,Int]
(declare-const m@0@06 Map<Int~_Int>)
; [exec]
; inhale (1 in m)
(declare-const $t@1@06 $Snap)
(assert (! (= $t@1@06 $Snap.unit) :named assumption_37))
; [eval] (1 in m)
(assert (! (Set_in 1 (Map_domain m@0@06)) :named assumption_38))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; assert unused_map_inhale(m) == true
; [eval] unused_map_inhale(m) == true
; [eval] unused_map_inhale(m)
(set-option :rlimit 0)
(push) ; 3
(declare-const $t@2@06 Map<Int~_Int>)
(assert (! (Map_equal $t@2@06 m@0@06) :named assumption_39))
; [eval] (1 in m)
(push) ; 4
(assert (! (not (Set_in 1 (Map_domain $t@2@06))) :named assertion_40))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (prover_33 assumption_38 assumption_39 assertion_40)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (Set_in 1 (Map_domain $t@2@06)) :named assumption_41))
(assert (! (unused_map_inhale%precondition $Snap.unit m@0@06) :named assumption_42))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (Map_equal $t@2@06 m@0@06)
  (Set_in 1 (Map_domain $t@2@06))
  (unused_map_inhale%precondition $Snap.unit m@0@06)) :named assumption_43))
(push) ; 3
(assert (! (not (= (unused_map_inhale $Snap.unit m@0@06) true)) :named assertion_44))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_15 assumption_43 assertion_44)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (= (unused_map_inhale $Snap.unit m@0@06) true) :named assumption_45))
(pop) ; 2
(pop) ; 1
