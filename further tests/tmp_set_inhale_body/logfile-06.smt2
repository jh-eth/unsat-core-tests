(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-26 14:58:51
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/further_test_successful_used_preconditions/fp_func_set_inhale_body.vpr
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
; Declaring symbols related to program functions (from program analysis)
(declare-fun set_inhale_body ($Snap Set<Int> Set<Int> Set<Int>) Int)
(declare-fun set_inhale_body%limited ($Snap Set<Int> Set<Int> Set<Int>) Int)
(declare-fun set_inhale_body%stateless (Set<Int> Set<Int> Set<Int>) Bool)
(declare-fun set_inhale_body%precondition ($Snap Set<Int> Set<Int> Set<Int>) Bool)
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
(assert (! (forall ((s@$ $Snap) (s@0@00 Set<Int>) (t@1@00 Set<Int>) (u@2@00 Set<Int>)) (!
  (=
    (set_inhale_body%limited s@$ s@0@00 t@1@00 u@2@00)
    (set_inhale_body s@$ s@0@00 t@1@00 u@2@00))
  :pattern ((set_inhale_body s@$ s@0@00 t@1@00 u@2@00))
  :qid |quant-u-0|)) :named axiom_30))
(assert (! (forall ((s@$ $Snap) (s@0@00 Set<Int>) (t@1@00 Set<Int>) (u@2@00 Set<Int>)) (!
  (set_inhale_body%stateless s@0@00 t@1@00 u@2@00)
  :pattern ((set_inhale_body%limited s@$ s@0@00 t@1@00 u@2@00))
  :qid |quant-u-1|)) :named axiom_31))
(assert (! (forall ((s@$ $Snap) (s@0@00 Set<Int>) (t@1@00 Set<Int>) (u@2@00 Set<Int>)) (!
  (=>
    (set_inhale_body%precondition s@$ s@0@00 t@1@00 u@2@00)
    (= (set_inhale_body s@$ s@0@00 t@1@00 u@2@00) (ite (Set_in 1 s@0@00) 1 0)))
  :pattern ((set_inhale_body s@$ s@0@00 t@1@00 u@2@00))
  :qid |quant-u-2|)) :named axiom_32))
(assert (! (forall ((s@$ $Snap) (s@0@00 Set<Int>) (t@1@00 Set<Int>) (u@2@00 Set<Int>)) (!
  true
  :pattern ((set_inhale_body s@$ s@0@00 t@1@00 u@2@00))
  :qid |quant-u-3|)) :named axiom_33))
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
; var s: Set[Int]
(declare-const s@0@06 Set<Int>)
; [exec]
; var t: Set[Int]
(declare-const t@1@06 Set<Int>)
; [exec]
; var u: Set[Int]
(declare-const u@2@06 Set<Int>)
; [exec]
; inhale t == Set(2)
(declare-const $t@3@06 $Snap)
(assert (! (= $t@3@06 $Snap.unit) :named assumption_54))
; [eval] t == Set(2)
; [eval] Set(2)
(assert (! (Set_equal t@1@06 (Set_singleton 2)) :named assumption_55))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; inhale u == t
(declare-const $t@4@06 $Snap)
(assert (! (= $t@4@06 $Snap.unit) :named assumption_56))
; [eval] u == t
(assert (! (Set_equal u@2@06 t@1@06) :named assumption_57))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale (1 in s)
(declare-const $t@5@06 $Snap)
(assert (! (= $t@5@06 $Snap.unit) :named assumption_58))
; [eval] (1 in s)
(assert (! (Set_in 1 s@0@06) :named assumption_59))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert set_inhale_body(s, t, u) == 1
; [eval] set_inhale_body(s, t, u) == 1
; [eval] set_inhale_body(s, t, u)
(set-option :rlimit 0)
(push) ; 3
(declare-const $t@6@06 Set<Int>)
(assert (! (Set_equal $t@6@06 s@0@06) :named assumption_60))
(declare-const $t@7@06 Set<Int>)
(assert (! (Set_equal $t@7@06 t@1@06) :named assumption_61))
(declare-const $t@8@06 Set<Int>)
(assert (! (Set_equal $t@8@06 u@2@06) :named assumption_62))
; [eval] (1 in s)
(push) ; 4
(assert (! (not (Set_in 1 $t@6@06)) :named assertion_63))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (prover_25 assumption_59 assumption_60 assertion_63)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (Set_in 1 $t@6@06) :named assumption_64))
; [eval] (2 in t)
(push) ; 4
(assert (! (not (Set_in 2 $t@7@06)) :named assertion_65))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (prover_3 prover_25 assumption_55 assumption_61 assertion_65)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (Set_in 2 $t@7@06) :named assumption_66))
(assert (! (set_inhale_body%precondition ($Snap.combine $Snap.unit $Snap.unit) s@0@06 t@1@06 u@2@06) :named assumption_67))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (Set_equal $t@6@06 s@0@06)
  (Set_equal $t@7@06 t@1@06)
  (Set_equal $t@8@06 u@2@06)
  (Set_in 1 $t@6@06)
  (Set_in 2 $t@7@06)
  (set_inhale_body%precondition ($Snap.combine $Snap.unit $Snap.unit) s@0@06 t@1@06 u@2@06)) :named assumption_68))
(push) ; 3
(assert (! (not (=
  (set_inhale_body ($Snap.combine $Snap.unit $Snap.unit) s@0@06 t@1@06 u@2@06)
  1)) :named assertion_69))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_32 assumption_59 assumption_68 assertion_69)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (=
  (set_inhale_body ($Snap.combine $Snap.unit $Snap.unit) s@0@06 t@1@06 u@2@06)
  1) :named assumption_70))
(pop) ; 2
(pop) ; 1
