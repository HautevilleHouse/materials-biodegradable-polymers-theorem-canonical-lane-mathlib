import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsBiodegradablePolymersTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse