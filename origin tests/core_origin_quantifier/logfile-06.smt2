(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-27 09:31:13
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/viper_function_unused_precondition_value_origins/fp_origin_quantifier_int.vpr
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
; ////////// Symbols
; Declaring symbols related to program functions (from program analysis)
(declare-fun unused_pre_quantifier_int ($Snap Int) Int)
(declare-fun unused_pre_quantifier_int%limited ($Snap Int) Int)
(declare-fun unused_pre_quantifier_int%stateless (Int) Bool)
(declare-fun unused_pre_quantifier_int%precondition ($Snap Int) Bool)
(declare-fun mark ($Snap Int) Bool)
(declare-fun mark%limited ($Snap Int) Bool)
(declare-fun mark%stateless (Int) Bool)
(declare-fun mark%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
; ////////// Uniqueness assumptions from domains
; ////////// Axioms
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
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=
    (unused_pre_quantifier_int%limited s@$ x@0@00)
    (unused_pre_quantifier_int s@$ x@0@00))
  :pattern ((unused_pre_quantifier_int s@$ x@0@00))
  :qid |quant-u-0|)) :named axiom_15))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (unused_pre_quantifier_int%stateless x@0@00)
  :pattern ((unused_pre_quantifier_int%limited s@$ x@0@00))
  :qid |quant-u-1|)) :named axiom_16))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (unused_pre_quantifier_int%precondition s@$ x@0@00)
    (= (unused_pre_quantifier_int s@$ x@0@00) 0))
  :pattern ((unused_pre_quantifier_int s@$ x@0@00))
  :qid |quant-u-4|)) :named axiom_17))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  true
  :pattern ((unused_pre_quantifier_int s@$ x@0@00))
  :qid |quant-u-5|)) :named axiom_18))
(assert (! (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (= (mark%limited s@$ i@2@00) (mark s@$ i@2@00))
  :pattern ((mark s@$ i@2@00))
  :qid |quant-u-2|)) :named axiom_19))
(assert (! (forall ((s@$ $Snap) (i@2@00 Int)) (!
  (mark%stateless i@2@00)
  :pattern ((mark%limited s@$ i@2@00))
  :qid |quant-u-3|)) :named axiom_20))
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
; var x: Int
(declare-const x@0@06 Int)
; [exec]
; inhale mark(x)
(declare-const $t@1@06 $Snap)
(assert (! (= $t@1@06 $Snap.unit) :named assumption_51))
; [eval] mark(x)
(push) ; 3
(declare-const $t@2@06 Int)
(assert (! (= $t@2@06 x@0@06) :named assumption_52))
(assert (! (mark%precondition $Snap.unit x@0@06) :named assumption_53))
(pop) ; 3
; Joined path conditions
(assert (! (and (= $t@2@06 x@0@06) (mark%precondition $Snap.unit x@0@06)) :named assumption_54))
(assert (! (mark $Snap.unit x@0@06) :named assumption_55))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; inhale (forall i: Int :: { mark(i) } mark(i) ==> i > 0)
(declare-const $t@3@06 $Snap)
(assert (! (= $t@3@06 $Snap.unit) :named assumption_56))
; [eval] (forall i: Int :: { mark(i) } mark(i) ==> i > 0)
(declare-const i@4@06 Int)
(set-option :rlimit 0)
(push) ; 3
; [eval] mark(i) ==> i > 0
; [eval] mark(i)
(push) ; 4
(declare-const $t@5@06 Int)
(assert (! (= $t@5@06 i@4@06) :named assumption_57))
(assert (! (mark%precondition $Snap.unit i@4@06) :named assumption_58))
(pop) ; 4
; Joined path conditions
(assert (! (and (= $t@5@06 i@4@06) (mark%precondition $Snap.unit i@4@06)) :named assumption_59))
(push) ; 4
; [then-branch: 0 | mark(_, i@4@06) | live]
; [else-branch: 0 | !(mark(_, i@4@06)) | live]
(push) ; 5
; [then-branch: 0 | mark(_, i@4@06)]
(assert (! (mark $Snap.unit i@4@06) :named assumption_60))
; [eval] i > 0
(pop) ; 5
(push) ; 5
; [else-branch: 0 | !(mark(_, i@4@06))]
(assert (! (not (mark $Snap.unit i@4@06)) :named assumption_61))
(pop) ; 5
(pop) ; 4
; Joined path conditions
; Joined path conditions
(assert (! (or (not (mark $Snap.unit i@4@06)) (mark $Snap.unit i@4@06)) :named assumption_62))
(pop) ; 3
; Nested auxiliary terms: globals (aux)
; Nested auxiliary terms: non-globals (aux)
(assert (! (forall ((i@4@06 Int)) (!
  (and
    (= $t@5@06 i@4@06)
    (mark%precondition $Snap.unit i@4@06)
    (or (not (mark $Snap.unit i@4@06)) (mark $Snap.unit i@4@06)))
  :pattern ((mark%limited $Snap.unit i@4@06))
  :qid |prog./workspaces/develop/precision_tests/viper_function_unused_precondition_value_origins/fp_origin_quantifier_int.vpr@16@10@16@56-aux|)) :named assumption_63))
(assert (! (forall ((i@4@06 Int)) (!
  (=> (mark $Snap.unit i@4@06) (> i@4@06 0))
  :pattern ((mark%limited $Snap.unit i@4@06))
  :qid |prog./workspaces/develop/precision_tests/viper_function_unused_precondition_value_origins/fp_origin_quantifier_int.vpr@16@10@16@56|)) :named assumption_64))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; assert x > 0
; [eval] x > 0
(set-option :rlimit 0)
(push) ; 3
(assert (! (not (> x@0@06 0)) :named assertion_65))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_55 assumption_64 assertion_65)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (> x@0@06 0) :named assumption_66))
; [exec]
; assert unused_pre_quantifier_int(x) == 0
; [eval] unused_pre_quantifier_int(x) == 0
; [eval] unused_pre_quantifier_int(x)
(push) ; 3
(declare-const $t@6@06 Int)
(assert (! (= $t@6@06 x@0@06) :named assumption_67))
; [eval] x > 0
(push) ; 4
(assert (! (not (> $t@6@06 0)) :named assertion_68))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_66 assumption_67 assertion_68)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (> $t@6@06 0) :named assumption_69))
(assert (! (unused_pre_quantifier_int%precondition $Snap.unit x@0@06) :named assumption_70))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (= $t@6@06 x@0@06)
  (> $t@6@06 0)
  (unused_pre_quantifier_int%precondition $Snap.unit x@0@06)) :named assumption_71))
(push) ; 3
(assert (! (not (= (unused_pre_quantifier_int $Snap.unit x@0@06) 0)) :named assertion_72))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_17 assertion_72 assumption_71)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (= (unused_pre_quantifier_int $Snap.unit x@0@06) 0) :named assumption_73))
(pop) ; 2
(pop) ; 1
