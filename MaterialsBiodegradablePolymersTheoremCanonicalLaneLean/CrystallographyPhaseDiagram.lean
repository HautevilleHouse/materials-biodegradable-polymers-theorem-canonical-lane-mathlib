import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsBiodegradablePolymersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure CrystallographyPhaseDiagramPackage where
  polymerUnitCell : Type
  unitCellGeometry : Prop
  crystalSystem : Prop
  phaseBoundary : Prop
  freeEnergyDensity : Prop

structure CrystallographyPhaseDiagramEvidence (C : CrystallographyPhaseDiagramPackage) where
  unitCellGeometryClosed : C.unitCellGeometry
  crystalSystemClosed : C.crystalSystem
  phaseBoundaryClosed : C.phaseBoundary
  freeEnergyDensityClosed : C.freeEnergyDensity

def CrystallographyPhaseDiagramClosed (C : CrystallographyPhaseDiagramPackage) : Prop :=
  C.unitCellGeometry ∧ C.crystalSystem ∧ C.phaseBoundary ∧ C.freeEnergyDensity

theorem crystallography_phase_diagram_closed_from_evidence
    (C : CrystallographyPhaseDiagramPackage) (E : CrystallographyPhaseDiagramEvidence C) :
    CrystallographyPhaseDiagramClosed C := by
  exact And.intro E.unitCellGeometryClosed
    (And.intro E.crystalSystemClosed
      (And.intro E.phaseBoundaryClosed E.freeEnergyDensityClosed))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse