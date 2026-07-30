import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : BiodegradablePolymerObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PolymerWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse