import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure CrystallographicUnitCell where
  latticeParameters : Type u
  spaceGroup : Type v
  atomPositions : Type w
  latticeParametersSatisfy : Prop
  spaceGroupSymmetric : Prop
  atomPositionsConsistent : Prop

structure CrystallographyEvidence (C : CrystallographicUnitCell) where
  latticeParametersSatisfyClosed : C.latticeParametersSatisfy
  spaceGroupSymmetricClosed : C.spaceGroupSymmetric
  atomPositionsConsistentClosed : C.atomPositionsConsistent

def CrystallographyClosed (C : CrystallographicUnitCell) : Prop :=
  C.latticeParametersSatisfy ∧ C.spaceGroupSymmetric ∧ C.atomPositionsConsistent

theorem crystallography_closed_from_evidence (C : CrystallographicUnitCell) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.latticeParametersSatisfyClosed
    (And.intro E.spaceGroupSymmetricClosed E.atomPositionsConsistentClosed)

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse