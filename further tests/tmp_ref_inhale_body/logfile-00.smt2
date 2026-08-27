(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-26 14:53:53
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/further_test_successful_used_preconditions/fp_func_ref_inhale_body.vpr
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
(declare-fun used_unused_ref_inhale ($Snap $Ref $Ref $Ref) Int)
(declare-fun used_unused_ref_inhale%limited ($Snap $Ref $Ref $Ref) Int)
(declare-fun used_unused_ref_inhale%stateless ($Ref $Ref $Ref) Bool)
(declare-fun used_unused_ref_inhale%precondition ($Snap $Ref $Ref $Ref) Bool)
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
; ---------- FUNCTION used_unused_ref_inhale----------
(declare-fun r@0@00 () $Ref)
(declare-fun u@1@00 () $Ref)
(declare-fun v@2@00 () $Ref)
(declare-fun result@3@00 () Int)
; ----- Well-definedness of specifications -----
(set-option :rlimit 0)
(push) ; 1
(assert (! (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$))) :named assumption_2))
(assert (! (= ($Snap.first s@$) $Snap.unit) :named assumption_3))
; [eval] r != null
(assert (! (not (= r@0@00 $Ref.null)) :named assumption_4))
(assert (! (= ($Snap.second s@$) $Snap.unit) :named assumption_5))
; [eval] u != null
(assert (! (not (= u@1@00 $Ref.null)) :named assumption_6))
(pop) ; 1
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  (=
    (used_unused_ref_inhale%limited s@$ r@0@00 u@1@00 v@2@00)
    (used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :pattern ((used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-0|)) :named axiom_7))
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  (used_unused_ref_inhale%stateless r@0@00 u@1@00 v@2@00)
  :pattern ((used_unused_ref_inhale%limited s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-1|)) :named axiom_8))
; ----- Verification of function body and postcondition -----
(push) ; 1
(declare-const $$analysisLabel$$@4@00 Bool)
(assert (! $$analysisLabel$$@4@00 :named assumption_9))
(declare-const $$analysisLabel$$@5@00 Bool)
(assert (! $$analysisLabel$$@5@00 :named assumption_10))
(declare-const $$analysisLabel$$@6@00 Bool)
(assert (! $$analysisLabel$$@6@00 :named assumption_11))
(declare-const $$analysisLabel$$@7@00 Bool)
(assert (! $$analysisLabel$$@7@00 :named assumption_12))
(declare-const $$analysisLabel$$@8@00 Bool)
(assert (! $$analysisLabel$$@8@00 :named assumption_13))
(assert (! (=>
  $$analysisLabel$$@4@00
  (= s@$ ($Snap.combine ($Snap.first s@$) ($Snap.second s@$)))) :named assumption_14))
(assert (! (=> $$analysisLabel$$@5@00 (= ($Snap.first s@$) $Snap.unit)) :named assumption_15))
(assert (! (=> $$analysisLabel$$@6@00 (not (= r@0@00 $Ref.null))) :named assumption_16))
(assert (! (=> $$analysisLabel$$@7@00 (= ($Snap.second s@$) $Snap.unit)) :named assumption_17))
(assert (! (=> $$analysisLabel$$@8@00 (not (= u@1@00 $Ref.null))) :named assumption_18))
; State saturation: after contract
(set-option :rlimit 500000)
(check-sat)
; unknown
; [eval] (r == null ? 0 : 1)
; [eval] r == null
(set-option :rlimit 0)
(push) ; 2
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (not (= r@0@00 $Ref.null))) :named assertion_19))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_11 assumption_16 assertion_19)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [then-branch: 0 | r@0@00 == Null | dead]
; [else-branch: 0 | r@0@00 != Null | live]
(set-option :rlimit 0)
(push) ; 3
; [then-branch: 0 | r@0@00 == Null]
(assert (! (= r@0@00 $Ref.null) :named assumption_20))
(set-option :rlimit 100000)
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_11 assumption_16 assumption_20)
(pop) ; 3
(set-option :rlimit 0)
(push) ; 3
; [else-branch: 0 | r@0@00 != Null]
(assert (! (not (= r@0@00 $Ref.null)) :named assumption_23))
(pop) ; 3
(pop) ; 2
; Joined path conditions
; Joined path conditions
(assert (! (or (not (= r@0@00 $Ref.null)) (= r@0@00 $Ref.null)) :named assumption_24))
(assert (! (= result@3@00 (ite (= r@0@00 $Ref.null) 0 1)) :named assumption_25))
(pop) ; 1
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  (=>
    (used_unused_ref_inhale%precondition s@$ r@0@00 u@1@00 v@2@00)
    (=
      (used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00)
      (ite (= r@0@00 $Ref.null) 0 1)))
  :pattern ((used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-2|)) :named axiom_26))
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  true
  :pattern ((used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-3|)) :named axiom_27))
