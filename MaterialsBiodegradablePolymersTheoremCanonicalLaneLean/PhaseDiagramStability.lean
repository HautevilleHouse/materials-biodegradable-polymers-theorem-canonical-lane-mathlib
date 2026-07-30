import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure PhaseDiagram where
  temperatureRange : Type u
  pressureRange : Type v
  phaseBoundaries : Type w
  temperatureRangeDefined : Prop
  pressureRangeDefined : Prop
  phaseBoundariesValid : Prop

structure PhaseDiagramEvidence (P : PhaseDiagram) where
  temperatureRangeDefinedClosed : P.temperatureRangeDefined
  pressureRangeDefinedClosed : P.pressureRangeDefined
  phaseBoundariesValidClosed : P.phaseBoundariesValid

def PhaseDiagramClosed (P : PhaseDiagram) : Prop :=
  P.temperatureRangeDefined ∧ P.pressureRangeDefined ∧ P.phaseBoundariesValid

theorem phase_diagram_closed_from_evidence (P : PhaseDiagram) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeDefinedClosed
    (And.intro E.pressureRangeDefinedClosed E.phaseBoundariesValidClosed)

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse