import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

def ConstrainedBiodegradablePolymersClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_biodegradable_polymers_endgame (A : AdmissibleClass) :
    ConstrainedBiodegradablePolymersClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse