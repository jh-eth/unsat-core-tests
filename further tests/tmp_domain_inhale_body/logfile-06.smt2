(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-26 14:30:40
; Silicon.version: 1.1-SNAPSHOT (b40ab96f+@hollensteinj/path-sensitive_analysis)
; Input file: /workspaces/develop/precision_tests/further_test_successful_used_preconditions/fp_func_domain_inhale_body.vpr
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
(declare-sort Token 0)
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
(declare-fun $SortWrappers.TokenTo$Snap (Token) $Snap)
(declare-fun $SortWrappers.$SnapToToken ($Snap) Token)
(assert (forall ((x Token)) (!
    (= x ($SortWrappers.$SnapToToken($SortWrappers.TokenTo$Snap x)))
    :pattern (($SortWrappers.TokenTo$Snap x))
    :qid |$Snap.$SnapToTokenTo$Snap|
    )))
(assert (forall ((x $Snap)) (!
    (= x ($SortWrappers.TokenTo$Snap($SortWrappers.$SnapToToken x)))
    :pattern (($SortWrappers.$SnapToToken x))
    :qid |$Snap.TokenTo$SnapToToken|
    )))
; ////////// Symbols
(declare-fun token_valid<Bool> (Token) Bool)
; Declaring symbols related to program functions (from program analysis)
(declare-fun domain_inhale_body ($Snap Token Token Token) Bool)
(declare-fun domain_inhale_body%limited ($Snap Token Token Token) Bool)
(declare-fun domain_inhale_body%stateless (Token Token Token) Bool)
(declare-fun domain_inhale_body%precondition ($Snap Token Token Token) Bool)
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
(assert (! (forall ((s@$ $Snap) (t@0@00 Token) (u@1@00 Token) (v@2@00 Token)) (!
  (=
    (domain_inhale_body%limited s@$ t@0@00 u@1@00 v@2@00)
    (domain_inhale_body s@$ t@0@00 u@1@00 v@2@00))
  :pattern ((domain_inhale_body s@$ t@0@00 u@1@00 v@2@00))
  :qid |quant-u-0|)) :named axiom_30))
(assert (! (forall ((s@$ $Snap) (t@0@00 Token) (u@1@00 Token) (v@2@00 Token)) (!
  (domain_inhale_body%stateless t@0@00 u@1@00 v@2@00)
  :pattern ((domain_inhale_body%limited s@$ t@0@00 u@1@00 v@2@00))
  :qid |quant-u-1|)) :named axiom_31))
(assert (! (forall ((s@$ $Snap) (t@0@00 Token) (u@1@00 Token) (v@2@00 Token)) (!
  (=>
    (domain_inhale_body%precondition s@$ t@0@00 u@1@00 v@2@00)
    (= (domain_inhale_body s@$ t@0@00 u@1@00 v@2@00) (token_valid<Bool> t@0@00)))
  :pattern ((domain_inhale_body s@$ t@0@00 u@1@00 v@2@00))
  :qid |quant-u-2|)) :named axiom_32))
(assert (! (forall ((s@$ $Snap) (t@0@00 Token) (u@1@00 Token) (v@2@00 Token)) (!
  true
  :pattern ((domain_inhale_body s@$ t@0@00 u@1@00 v@2@00))
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
; var t: Token
(declare-const t@0@06 Token)
; [exec]
; var u: Token
(declare-const u@1@06 Token)
; [exec]
; var v: Token
(declare-const v@2@06 Token)
; [exec]
; inhale token_valid(u)
(declare-const $t@3@06 $Snap)
(assert (! (= $t@3@06 $Snap.unit) :named assumption_54))
; [eval] token_valid(u)
(assert (! (token_valid<Bool> u@1@06) :named assumption_55))
; State saturation: after inhale
(set-option :rlimit 200000)
(check-sat)
; unknown
; [exec]
; inhale u == v
(declare-const $t@4@06 $Snap)
(assert (! (= $t@4@06 $Snap.unit) :named assumption_56))
; [eval] u == v
(assert (! (= u@1@06 v@2@06) :named assumption_57))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; inhale token_valid(t)
(declare-const $t@5@06 $Snap)
(assert (! (= $t@5@06 $Snap.unit) :named assumption_58))
; [eval] token_valid(t)
(assert (! (token_valid<Bool> t@0@06) :named assumption_59))
; State saturation: after inhale
(check-sat)
; unknown
; [exec]
; assert domain_inhale_body(t, u, v) == true
; [eval] domain_inhale_body(t, u, v) == true
; [eval] domain_inhale_body(t, u, v)
(set-option :rlimit 0)
(push) ; 3
(declare-const $t@6@06 Token)
(assert (! (= $t@6@06 t@0@06) :named assumption_60))
(declare-const $t@7@06 Token)
(assert (! (= $t@7@06 u@1@06) :named assumption_61))
(declare-const $t@8@06 Token)
(assert (! (= $t@8@06 v@2@06) :named assumption_62))
; [eval] token_valid(t)
(push) ; 4
(assert (! (not (token_valid<Bool> $t@6@06)) :named assertion_63))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_59 assumption_60 assertion_63)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (token_valid<Bool> $t@6@06) :named assumption_64))
; [eval] token_valid(u)
(push) ; 4
(assert (! (not (token_valid<Bool> $t@7@06)) :named assertion_65))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_55 assumption_61 assertion_65)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (token_valid<Bool> $t@7@06) :named assumption_66))
(assert (! (domain_inhale_body%precondition ($Snap.combine $Snap.unit $Snap.unit) t@0@06 u@1@06 v@2@06) :named assumption_67))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (= $t@6@06 t@0@06)
  (= $t@7@06 u@1@06)
  (= $t@8@06 v@2@06)
  (token_valid<Bool> $t@6@06)
  (token_valid<Bool> $t@7@06)
  (domain_inhale_body%precondition ($Snap.combine $Snap.unit $Snap.unit) t@0@06 u@1@06 v@2@06)) :named assumption_68))
(push) ; 3
(assert (! (not (=
  (domain_inhale_body ($Snap.combine $Snap.unit $Snap.unit) t@0@06 u@1@06 v@2@06)
  true)) :named assertion_69))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_32 assumption_57 assumption_59 assertion_69 assumption_68)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (=
  (domain_inhale_body ($Snap.combine $Snap.unit $Snap.unit) t@0@06 u@1@06 v@2@06)
  true) :named assumption_70))
(pop) ; 2
(pop) ; 1
