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
; ------------------------------------------------------------
; Begin function- and predicate-related preamble
; Declaring symbols related to program functions (from verification)
; Declaring symbols related to program functions (from verification)
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  (=
    (used_unused_ref_inhale%limited s@$ r@0@00 u@1@00 v@2@00)
    (used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :pattern ((used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-0|)) :named axiom_29))
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  (used_unused_ref_inhale%stateless r@0@00 u@1@00 v@2@00)
  :pattern ((used_unused_ref_inhale%limited s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-1|)) :named axiom_30))
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  (=>
    (used_unused_ref_inhale%precondition s@$ r@0@00 u@1@00 v@2@00)
    (=
      (used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00)
      (ite (= r@0@00 $Ref.null) 0 1)))
  :pattern ((used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-2|)) :named axiom_31))
(assert (! (forall ((s@$ $Snap) (r@0@00 $Ref) (u@1@00 $Ref) (v@2@00 $Ref)) (!
  true
  :pattern ((used_unused_ref_inhale s@$ r@0@00 u@1@00 v@2@00))
  :qid |quant-u-3|)) :named axiom_32))
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
; var r: Ref
(declare-const r@0@06 $Ref)
; [exec]
; var u: Ref
(declare-const u@1@06 $Ref)
; [exec]
; var v: Ref
(declare-const v@2@06 $Ref)
; [exec]
; inhale u != null
(declare-const $t@3@06 $Snap)
(assert (! (= $t@3@06 $Snap.unit) :named assumption_53))
; [eval] u != null
(assert (! (not (= u@1@06 $Ref.null)) :named assumption_54))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; inhale u == v
(declare-const $t@4@06 $Snap)
(assert (! (= $t@4@06 $Snap.unit) :named assumption_55))
; [eval] u == v
(assert (! (= u@1@06 v@2@06) :named assumption_56))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale r != null
(declare-const $t@5@06 $Snap)
(assert (! (= $t@5@06 $Snap.unit) :named assumption_57))
; [eval] r != null
(assert (! (not (= r@0@06 $Ref.null)) :named assumption_58))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert used_unused_ref_inhale(r, u, v) == 1
; [eval] used_unused_ref_inhale(r, u, v) == 1
; [eval] used_unused_ref_inhale(r, u, v)
(set-option :rlimit 0)
(push) ; 3
(declare-const $t@6@06 $Ref)
(assert (! (= $t@6@06 r@0@06) :named assumption_59))
(declare-const $t@7@06 $Ref)
(assert (! (= $t@7@06 u@1@06) :named assumption_60))
(declare-const $t@8@06 $Ref)
(assert (! (= $t@8@06 v@2@06) :named assumption_61))
; [eval] r != null
(push) ; 4
(assert (! (not (not (= $t@6@06 $Ref.null))) :named assertion_62))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_58 assumption_59 assertion_62)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (not (= $t@6@06 $Ref.null)) :named assumption_63))
; [eval] u != null
(push) ; 4
(assert (! (not (not (= $t@7@06 $Ref.null))) :named assertion_64))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_54 assumption_60 assertion_64)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (not (= $t@7@06 $Ref.null)) :named assumption_65))
(assert (! (used_unused_ref_inhale%precondition ($Snap.combine $Snap.unit $Snap.unit) r@0@06 u@1@06 v@2@06) :named assumption_66))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (= $t@6@06 r@0@06)
  (= $t@7@06 u@1@06)
  (= $t@8@06 v@2@06)
  (not (= $t@6@06 $Ref.null))
  (not (= $t@7@06 $Ref.null))
  (used_unused_ref_inhale%precondition ($Snap.combine $Snap.unit $Snap.unit) r@0@06 u@1@06 v@2@06)) :named assumption_67))
(push) ; 3
(assert (! (not (=
  (used_unused_ref_inhale ($Snap.combine $Snap.unit $Snap.unit) r@0@06 u@1@06 v@2@06)
  1)) :named assertion_68))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_31 assumption_56 assumption_58 assertion_68 assumption_67)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (=
  (used_unused_ref_inhale ($Snap.combine $Snap.unit $Snap.unit) r@0@06 u@1@06 v@2@06)
  1) :named assumption_69))
(pop) ; 2
(pop) ; 1
