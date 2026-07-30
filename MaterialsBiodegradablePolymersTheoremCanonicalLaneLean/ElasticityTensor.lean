import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsBiodegradablePolymersTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure ElasticityTensorPackage where
  moduli : Prop
  poissonRatio : Prop
  stressStrainRelationship : Prop
  elasticLimit : Prop

structure ElasticityTensorEvidence (E : ElasticityTensorPackage) where
  moduliClosed : E.moduli
  poissonRatioClosed : E.poissonRatio
  stressStrainRelationshipClosed : E.stressStrainRelationship
  elasticLimitClosed : E.elasticLimit

def ElasticityTensorClosed (E : ElasticityTensorPackage) : Prop :=
  E.moduli ∧ E.poissonRatio ∧ E.stressStrainRelationship ∧ E.elasticLimit

theorem elasticity_tensor_closed_from_evidence
    (E : ElasticityTensorPackage) (Ev : ElasticityTensorEvidence E) :
    ElasticityTensorClosed E := by
  exact And.intro Ev.moduliClosed
    (And.intro Ev.poissonRatioClosed
      (And.intro Ev.stressStrainRelationshipClosed Ev.elasticLimitClosed))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse