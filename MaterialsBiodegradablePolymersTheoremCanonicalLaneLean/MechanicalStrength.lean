import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure MechanicalStrength where
  tensileStrength : Type u
  compressiveStrength : Type v
  elasticModulus : Type w
  elongationAtBreak : Type x
  tensileStrengthDefined : Prop
  compressiveStrengthDefined : Prop
  elasticModulusDefined : Prop
  elongationAtBreakDefined : Prop

structure MechanicalStrengthEvidence (M : MechanicalStrength) where
  tensileStrengthDefinedClosed : M.tensileStrengthDefined
  compressiveStrengthDefinedClosed : M.compressiveStrengthDefined
  elasticModulusDefinedClosed : M.elasticModulusDefined
  elongationAtBreakDefinedClosed : M.elongationAtBreakDefined

def MechanicalStrengthClosed (M : MechanicalStrength) : Prop :=
  M.tensileStrengthDefined ∧ M.compressiveStrengthDefined ∧
  M.elasticModulusDefined ∧ M.elongationAtBreakDefined

theorem mechanical_strength_closed_from_evidence (M : MechanicalStrength) (E : MechanicalStrengthEvidence M) :
    MechanicalStrengthClosed M := by
  exact And.intro E.tensileStrengthDefinedClosed
    (And.intro E.compressiveStrengthDefinedClosed
      (And.intro E.elasticModulusDefinedClosed E.elongationAtBreakDefinedClosed))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse