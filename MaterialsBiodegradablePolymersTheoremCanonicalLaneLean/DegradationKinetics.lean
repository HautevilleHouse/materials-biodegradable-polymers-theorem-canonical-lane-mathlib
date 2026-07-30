import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure DegradationKineticsPackage where
  hydrolysisRate : Type u
  enzymaticDegradation : Prop
  molecularWeightDrop : Prop
  autocatalyticEffect : Prop
  degradationMechanism : Prop

structure DegradationKineticsEvidence (D : DegradationKineticsPackage) where
  hydrolysisRateClosed : D.hydrolysisRate
  enzymaticDegradationClosed : D.enzymaticDegradation
  molecularWeightDropClosed : D.molecularWeightDrop
  autocatalyticEffectClosed : D.autocatalyticEffect
  degradationMechanismClosed : D.degradationMechanism

def DegradationKineticsClosed (D : DegradationKineticsPackage) : Prop :=
  D.hydrolysisRate ∧ D.enzymaticDegradation ∧ D.molecularWeightDrop ∧ D.autocatalyticEffect ∧ D.degradationMechanism

theorem degradation_kinetics_closed_from_evidence (D : DegradationKineticsPackage) (E : DegradationKineticsEvidence D) :
    DegradationKineticsClosed D := by
  exact And.intro E.hydrolysisRateClosed (And.intro E.enzymaticDegradationClosed (And.intro E.molecularWeightDropClosed (And.intro E.autocatalyticEffectClosed E.degradationMechanismClosed)))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse