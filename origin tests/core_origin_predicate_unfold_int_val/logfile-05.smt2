(get-info :version)
; (:version "4.8.12")
; Started: 2026-08-29 12:45:31
; Silicon.version: 1.1-SNAPSHOT (39958bc4+@keuscha/dependency_analysis_refactoring)
; Input file: /workspaces/develop/precision_tests/viper_function_unused_precondition_value_origins/fp_origin_predicate_unfold_int.vpr
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
(declare-fun unused_pre_predicate_unfold_int ($Snap Int) Int)
(declare-fun unused_pre_predicate_unfold_int%limited ($Snap Int) Int)
(declare-fun unused_pre_predicate_unfold_int%stateless (Int) Bool)
(declare-fun unused_pre_predicate_unfold_int%precondition ($Snap Int) Bool)
; Snapshot variable to be used during function verification
(declare-fun s@$ () $Snap)
; Declaring predicate trigger functions
(declare-fun Five%trigger ($Snap $Ref) Bool)
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
    (unused_pre_predicate_unfold_int%limited s@$ x@0@00)
    (unused_pre_predicate_unfold_int s@$ x@0@00))
  :pattern ((unused_pre_predicate_unfold_int s@$ x@0@00))
  :qid |quant-u-0|)) :named axiom_27))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (unused_pre_predicate_unfold_int%stateless x@0@00)
  :pattern ((unused_pre_predicate_unfold_int%limited s@$ x@0@00))
  :qid |quant-u-1|)) :named axiom_28))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  (=>
    (unused_pre_predicate_unfold_int%precondition s@$ x@0@00)
    (= (unused_pre_predicate_unfold_int s@$ x@0@00) 0))
  :pattern ((unused_pre_predicate_unfold_int s@$ x@0@00))
  :qid |quant-u-2|)) :named axiom_29))
(assert (! (forall ((s@$ $Snap) (x@0@00 Int)) (!
  true
  :pattern ((unused_pre_predicate_unfold_int s@$ x@0@00))
  :qid |quant-u-3|)) :named axiom_30))
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
(declare-const r@0@05 $Ref)
; [exec]
; var x: Int
(declare-const x@1@05 Int)
; [exec]
; r := new(f)
(declare-const r@2@05 $Ref)
(assert (! (not (= r@2@05 $Ref.null)) :named assumption_56))
(declare-const f@3@05 Int)
(declare-const $$analysisLabel$$@4@05 Bool)
(assert (! $$analysisLabel$$@4@05 :named assumption_57))
(assert (! (not (= r@2@05 r@0@05)) :named assumption_59))
; [exec]
; r.f := 5
(declare-const f@5@05 Int)
(assert (! (= f@5@05 5) :named assumption_60))
(declare-const $$analysisLabel$$@6@05 Bool)
(assert (! $$analysisLabel$$@6@05 :named assumption_61))
(declare-const $$analysisLabel$$@7@05 Bool)
(assert (! $$analysisLabel$$@7@05 :named assumption_66))
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (=
  (ite
    $$analysisLabel$$@6@05
    (-
      (ite $$analysisLabel$$@4@05 $Perm.Write $Perm.No)
      ($Perm.min (ite $$analysisLabel$$@4@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  $Perm.No)) :named assertion_68))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assertion_68)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :rlimit 0)
(push) ; 3
(assert (! (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@4@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@4@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))) :named assertion_72))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_57 assertion_72)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $$analysisLabel$$@8@05 Bool)
(assert (! $$analysisLabel$$@8@05 :named assumption_73))
(assert (! (<= $Perm.No (ite $$analysisLabel$$@8@05 $Perm.Write $Perm.No)) :named assumption_79))
(assert (! (<= (ite $$analysisLabel$$@8@05 $Perm.Write $Perm.No) $Perm.Write) :named assumption_80))
(assert (! (=> $$analysisLabel$$@8@05 (not (= r@2@05 $Ref.null))) :named assumption_81))
; [exec]
; fold acc(Five(r), write)
(declare-const $$analysisLabel$$@9@05 Bool)
(assert (! $$analysisLabel$$@9@05 :named assumption_82))
(declare-const $$analysisLabel$$@10@05 Bool)
(assert (! $$analysisLabel$$@10@05 :named assumption_84))
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (=
  (ite
    $$analysisLabel$$@9@05
    (-
      (ite $$analysisLabel$$@8@05 $Perm.Write $Perm.No)
      ($Perm.min (ite $$analysisLabel$$@8@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  $Perm.No)) :named assertion_86))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assertion_86)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :rlimit 0)
(push) ; 3
(assert (! (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@8@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@8@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))) :named assertion_87))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_73 assertion_87)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
; [eval] r.f == 5
(push) ; 3
(assert (! (not $$analysisLabel$$@8@05) :named assertion_88))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_73 assertion_88)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(assert (! (not (= f@5@05 5)) :named assertion_89))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_60 assertion_89)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (Five%trigger ($Snap.combine ($SortWrappers.IntTo$Snap f@5@05) $Snap.unit) r@2@05) :named assumption_90))
(declare-const $$analysisLabel$$@11@05 Bool)
(assert (! $$analysisLabel$$@11@05 :named assumption_91))
(assert (! (<= $Perm.No (ite $$analysisLabel$$@11@05 $Perm.Write $Perm.No)) :named assumption_94))
; [exec]
; hide(r)
(declare-const $t@12@05 $Ref)
(assert (! (= $t@12@05 r@2@05) :named assumption_96))
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (= r@2@05 $t@12@05)) :named assertion_97))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assertion_97 assumption_96)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $$analysisLabel$$@13@05 Bool)
(assert (! $$analysisLabel$$@13@05 :named assumption_98))
(declare-const $$analysisLabel$$@14@05 Bool)
(assert (! $$analysisLabel$$@14@05 :named assumption_100))
(set-option :rlimit 0)
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (=
  (ite
    $$analysisLabel$$@13@05
    (-
      (ite $$analysisLabel$$@11@05 $Perm.Write $Perm.No)
      ($Perm.min (ite $$analysisLabel$$@11@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  $Perm.No)) :named assertion_102))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assertion_102)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :rlimit 0)
(push) ; 3
(assert (! (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@11@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@11@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))) :named assertion_103))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_91 assertion_103)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $t@15@05 $Snap)
(declare-const $$analysisLabel$$@16@05 Bool)
(assert (! $$analysisLabel$$@16@05 :named assumption_104))
(assert (! (<= $Perm.No (ite $$analysisLabel$$@16@05 $Perm.Write $Perm.No)) :named assumption_107))
; State saturation: after contract
(set-option :rlimit 500000)
(check-sat)
; unknown
; [exec]
; unfold acc(Five(r), write)
(set-option :rlimit 0)
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (= $t@12@05 r@2@05)) :named assertion_108))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assertion_108 assumption_96)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(declare-const $$analysisLabel$$@17@05 Bool)
(assert (! $$analysisLabel$$@17@05 :named assumption_109))
(declare-const $$analysisLabel$$@18@05 Bool)
(assert (! $$analysisLabel$$@18@05 :named assumption_111))
(set-option :rlimit 0)
(push) ; 3
(set-option :rlimit 100000)
(assert (! (not (=
  (ite
    $$analysisLabel$$@17@05
    (-
      (ite $$analysisLabel$$@16@05 $Perm.Write $Perm.No)
      ($Perm.min (ite $$analysisLabel$$@16@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  $Perm.No)) :named assertion_113))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assertion_113)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(set-option :rlimit 0)
(push) ; 3
(assert (! (not (or
  (=
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@16@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No)
  (<
    (-
      $Perm.Write
      ($Perm.min (ite $$analysisLabel$$@16@05 $Perm.Write $Perm.No) $Perm.Write))
    $Perm.No))) :named assertion_114))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_104 assertion_114)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (= $t@15@05 ($Snap.combine ($Snap.first $t@15@05) ($Snap.second $t@15@05))) :named assumption_115))
(declare-const $$analysisLabel$$@19@05 Bool)
(assert (! $$analysisLabel$$@19@05 :named assumption_116))
(assert (! (<= $Perm.No (ite $$analysisLabel$$@19@05 $Perm.Write $Perm.No)) :named assumption_119))
(assert (! (<= (ite $$analysisLabel$$@19@05 $Perm.Write $Perm.No) $Perm.Write) :named assumption_120))
(assert (! (=> $$analysisLabel$$@19@05 (not (= r@2@05 $Ref.null))) :named assumption_121))
(assert (! (= ($Snap.second $t@15@05) $Snap.unit) :named assumption_122))
; [eval] r.f == 5
(push) ; 3
(assert (! (not $$analysisLabel$$@19@05) :named assertion_123))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_116 assertion_123)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (= ($SortWrappers.$SnapToInt ($Snap.first $t@15@05)) 5) :named assumption_124))
; State saturation: after unfold
(set-option :rlimit 400000)
(check-sat)
; unknown
(assert (! (Five%trigger $t@15@05 r@2@05) :named assumption_125))
; [exec]
; assert unused_pre_predicate_unfold_int(r.f) == 0
; [eval] unused_pre_predicate_unfold_int(r.f) == 0
; [eval] unused_pre_predicate_unfold_int(r.f)
(set-option :rlimit 0)
(push) ; 3
(assert (! (not $$analysisLabel$$@19@05) :named assertion_126))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_116 assertion_126)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(push) ; 3
(declare-const $t@20@05 Int)
(assert (! (= $t@20@05 ($SortWrappers.$SnapToInt ($Snap.first $t@15@05))) :named assumption_127))
; [eval] x > 0
(push) ; 4
(assert (! (not (> $t@20@05 0)) :named assertion_128))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (assumption_124 assertion_128 assumption_127)
(pop) ; 4
; 0.00s
; (get-info :all-statistics)
(assert (! (> $t@20@05 0) :named assumption_129))
(assert (! (unused_pre_predicate_unfold_int%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@15@05))) :named assumption_130))
(pop) ; 3
; Joined path conditions
(assert (! (and
  (= $t@20@05 ($SortWrappers.$SnapToInt ($Snap.first $t@15@05)))
  (> $t@20@05 0)
  (unused_pre_predicate_unfold_int%precondition $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@15@05)))) :named assumption_131))
(push) ; 3
(assert (! (not (=
  (unused_pre_predicate_unfold_int $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@15@05)))
  0)) :named assertion_132))
(check-sat)
; unsat
(get-unsat-core)
; unsat core: (axiom_29 assumption_124 assumption_131 assertion_132)
(pop) ; 3
; 0.00s
; (get-info :all-statistics)
(assert (! (=
  (unused_pre_predicate_unfold_int $Snap.unit ($SortWrappers.$SnapToInt ($Snap.first $t@15@05)))
  0) :named assumption_133))
(pop) ; 2
(pop) ; 1
