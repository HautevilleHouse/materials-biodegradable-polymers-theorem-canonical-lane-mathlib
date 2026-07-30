import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure FractureMechanicsPackage where
  fractureToughness : Type u
  crackPropagation : Prop
  crazeFormation : Prop
  environmentalStressCracking : Prop
  fractureEnergy : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackPropagationClosed : F.crackPropagation
  crazeFormationClosed : F.crazeFormation
  environmentalStressCrackingClosed : F.environmentalStressCracking
  fractureEnergyClosed : F.fractureEnergy

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.crackPropagation ∧ F.crazeFormation ∧ F.environmentalStressCracking ∧ F.fractureEnergy

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage) (E : FractureMechanicsEvidence F) :
    FractureMechanicsClosed F := by
  exact And.intro E.crackPropagationClosed (And.intro E.crazeFormationClosed (And.intro E.environmentalStressCrackingClosed E.fractureEnergyClosed))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse