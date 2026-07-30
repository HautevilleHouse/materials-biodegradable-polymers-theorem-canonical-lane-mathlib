import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure ElasticityPackage where
  youngModulus : Type u
  poissonRatio : Type v
  stressStrainCurve : Prop
  viscoelasticModel : Prop
  degradationUnderHydrolysis : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  stressStrainCurveClosed : E.stressStrainCurve
  viscoelasticModelClosed : E.viscoelasticModel
  degradationUnderHydrolysisClosed : E.degradationUnderHydrolysis

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.stressStrainCurve ∧ E.viscoelasticModel ∧ E.degradationUnderHydrolysis

theorem elasticity_closed_from_evidence (E : ElasticityPackage) (Ev : ElasticityEvidence E) :
    ElasticityClosed E := by
  exact And.intro Ev.stressStrainCurveClosed (And.intro Ev.viscoelasticModelClosed Ev.degradationUnderHydrolysisClosed)

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse