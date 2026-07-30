import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure CrystallographyPackage where
  unitCell : Type u
  latticeStructure : Prop
  spaceGroup : Prop
  polymerCrystalSize : Prop
  crystallinityFraction : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeStructureClosed : C.latticeStructure
  spaceGroupClosed : C.spaceGroup
  polymerCrystalSizeClosed : C.polymerCrystalSize
  crystallinityFractionClosed : C.crystallinityFraction

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeStructure ∧ C.spaceGroup ∧ C.polymerCrystalSize ∧ C.crystallinityFraction

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.latticeStructureClosed (And.intro E.spaceGroupClosed (And.intro E.polymerCrystalSizeClosed E.crystallinityFractionClosed))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse