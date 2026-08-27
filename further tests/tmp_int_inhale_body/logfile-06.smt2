(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-26 14:34:00
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/further_test_successful_used_preconditions/fp_func_int_inhale_body.vpr
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
(declare-fun int_inhale_body ($Snap Int Int Int) Int)
(declare-fun int_inhale_body%limited ($Snap Int Int Int) Int)
(declare-fun int_inhale_body%stateless (Int Int Int) Bool)
(declare-fun int_inhale_body%precondition ($Snap Int Int Int) Bool)
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
(assert (! (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Int)) (!
  (=
    (int_inhale_body%limited s@$ x@0@00 y@1@00 z@2@00)
    (int_inhale_body s@$ x@0@00 y@1@00 z@2@00))
  :pattern ((int_inhale_body s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-0|)) :named axiom_23))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Int)) (!
  (int_inhale_body%stateless x@0@00 y@1@00 z@2@00)
  :pattern ((int_inhale_body%limited s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-1|)) :named axiom_24))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Int)) (!
  (=>
    (int_inhale_body%precondition s@$ x@0@00 y@1@00 z@2@00)
    (= (int_inhale_body s@$ x@0@00 y@1@00 z@2@00) x@0@00))
  :pattern ((int_inhale_body s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-2|)) :named axiom_25))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int) (y@1@00 Int) (z@2@00 Int)) (!
  true
  :pattern ((int_inhale_body s@$ x@0@00 y@1@00 z@2@00))
  :qid |quant-u-3|)) :named axiom_26))
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
; var y: Int
(declare-const y@1@06 Int)
; [exec]
; var z: Int
(declare-const z@2@06 Int)
; [exec]
; inhale y < 8
(declare-const $t@3@06 $Snap)
(assert (! (= $t@3@06 $Snap.unit) :named assumption_47))
; [eval] y < 8
(assert (! (< y@1@06 8) :named assumption_48))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; inhale z == y
(declare-const $t@4@06 $Snap)
(assert (! (= $t@4@06 $Snap.unit) :named assumption_49))
; [eval] z == y
(assert (! (= z@2@06 y@1@06) :named assumption_50))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale x == 2
(declare-const $t@5@06 $Snap)
(assert (! (= $t@5@06 $Snap.unit) :named assumption_51))
; [eval] x == 2
(assert (! (= x@0@06 2) :named assumption_52))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert int_inhale_body(x, y, z) > 0
; [eval] int_inhale_body(x, y, z) > 0
; [eval] int_inhale_body(x, y, z)
(set-option :rlimit 0)
(push) ; 3
(declare-const $t@6@06 Int)
(assert (! (= $t@6@06 x@0@06) :named assumption_53))
(declare-const $t@7@06 Int)
(assert (! (= $t@7@06 y@1@06) :named assumption_54))
(declare-const $t@8@06 Int)
(assert (! (= $t@8@06 z@2@06) :named assumption_55))
; [eval] x > 0
(push) ; 4
(assert (! (not (> $t@6@06 0)) :named assertion_56))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_52 assumption_53 assertion_56)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (> $t@6@06 0) :named assumption_57))
; [eval] y < 10
(push) ; 4
(assert (! (not (< $t@7@06 10)) :named assertion_58))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_48 assumption_54 assertion_58)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (< $t@7@06 10) :named assumption_59))
(assert (! (int_inhale_body%precondition ($Snap.combine $Snap.unit $Snap.unit) x@0@06 y@1@06 z@2@06) :named assumption_60))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (= $t@6@06 x@0@06)
  (= $t@7@06 y@1@06)
  (= $t@8@06 z@2@06)
  (> $t@6@06 0)
  (< $t@7@06 10)
  (int_inhale_body%precondition ($Snap.combine $Snap.unit $Snap.unit) x@0@06 y@1@06 z@2@06)) :named assumption_61))
(push) ; 3
(assert (! (not (>
  (int_inhale_body ($Snap.combine $Snap.unit $Snap.unit) x@0@06 y@1@06 z@2@06)
  0)) :named assertion_62))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_25 assumption_50 assumption_52 assertion_62 assumption_61)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (>
  (int_inhale_body ($Snap.combine $Snap.unit $Snap.unit) x@0@06 y@1@06 z@2@06)
  0) :named assumption_63))
(pop) ; 2
(pop) ; 1
