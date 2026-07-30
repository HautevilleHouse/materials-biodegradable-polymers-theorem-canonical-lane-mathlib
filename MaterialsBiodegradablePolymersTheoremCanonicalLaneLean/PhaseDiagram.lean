import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureComposition : Type u
  meltingPoint : Prop
  glassTransition : Prop
  miscibilityGap : Prop
  phaseBoundaryKnown : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  meltingPointClosed : P.meltingPoint
  glassTransitionClosed : P.glassTransition
  miscibilityGapClosed : P.miscibilityGap
  phaseBoundaryKnownClosed : P.phaseBoundaryKnown

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.meltingPoint ∧ P.glassTransition ∧ P.miscibilityGap ∧ P.phaseBoundaryKnown

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.meltingPointClosed (And.intro E.glassTransitionClosed (And.intro E.miscibilityGapClosed E.phaseBoundaryKnownClosed))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse