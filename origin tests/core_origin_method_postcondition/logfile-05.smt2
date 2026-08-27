(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-27 08:49:32
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/viper_function_unused_precondition_value_origins/fp_origin_method_postcondition_int.vpr
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
(declare-fun unused_pre_method_postcondition_int ($Snap Int) Int)
(declare-fun unused_pre_method_postcondition_int%limited ($Snap Int) Int)
(declare-fun unused_pre_method_postcondition_int%stateless (Int) Bool)
(declare-fun unused_pre_method_postcondition_int%precondition ($Snap Int) Bool)
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
    (unused_pre_method_postcondition_int%limited s@$ x@0@00)
    (unused_pre_method_postcondition_int s@$ x@0@00))
  :pattern ((unused_pre_method_postcondition_int s@$ x@0@00))
  :qid |quant-u-0|)) :named axiom_17))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (unused_pre_method_postcondition_int%stateless x@0@00)
  :pattern ((unused_pre_method_postcondition_int%limited s@$ x@0@00))
  :qid |quant-u-1|)) :named axiom_18))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (unused_pre_method_postcondition_int%precondition s@$ x@0@00)
    (= (unused_pre_method_postcondition_int s@$ x@0@00) 0))
  :pattern ((unused_pre_method_postcondition_int s@$ x@0@00))
  :qid |quant-u-2|)) :named axiom_19))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  true
  :pattern ((unused_pre_method_postcondition_int s@$ x@0@00))
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
(declare-const x@0@05 Int)
; [exec]
; x := makePositive()
(declare-const x@1@05 Int)
(declare-const $t@2@05 $Snap)
(assert (! (= $t@2@05 $Snap.unit) :named assumption_42))
; [eval] x > 0
(assert (! (> x@1@05 0) :named assumption_43))
; State saturation: after contract
(set-option :rlimit 500000)
(check-sat)
; unknown
; [exec]
; assert unused_pre_method_postcondition_int(x) == 0
; [eval] unused_pre_method_postcondition_int(x) == 0
; [eval] unused_pre_method_postcondition_int(x)
(set-option :rlimit 0)
(push) ; 3
(declare-const $t@3@05 Int)
(assert (! (= $t@3@05 x@1@05) :named assumption_46))
; [eval] x > 0
(push) ; 4
(assert (! (not (> $t@3@05 0)) :named assertion_47))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_43 assumption_46 assertion_47)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (> $t@3@05 0) :named assumption_48))
(assert (! (unused_pre_method_postcondition_int%precondition $Snap.unit x@1@05) :named assumption_49))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (= $t@3@05 x@1@05)
  (> $t@3@05 0)
  (unused_pre_method_postcondition_int%precondition $Snap.unit x@1@05)) :named assumption_50))
(push) ; 3
(assert (! (not (= (unused_pre_method_postcondition_int $Snap.unit x@1@05) 0)) :named assertion_51))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_19 assumption_50 assertion_51)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (= (unused_pre_method_postcondition_int $Snap.unit x@1@05) 0) :named assumption_52))
(pop) ; 2
(pop) ; 1
