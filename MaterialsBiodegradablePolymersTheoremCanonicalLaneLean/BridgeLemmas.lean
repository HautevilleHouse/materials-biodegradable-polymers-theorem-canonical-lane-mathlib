import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsBiodegradablePolymersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PolymerWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse