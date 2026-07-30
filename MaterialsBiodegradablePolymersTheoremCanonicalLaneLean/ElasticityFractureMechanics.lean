import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure ElasticModuliPackage where
  youngModulus : ℝ
  poissonRatio : ℝ
  shearModulus : ℝ
  bulkModulus : ℝ
  youngModulusAdmissible : youngModulus > 0
  poissonRatioAdmissible : poissonRatio ∈ Set.Ioo (-1 : ℝ) 0.5
  shearModulusAdmissible : shearModulus > 0
  bulkModulusAdmissible : bulkModulus > 0

structure ElasticModuliEvidence (E : ElasticModuliPackage) where
  youngModulusClosed : E.youngModulusAdmissible
  poissonRatioClosed : E.poissonRatioAdmissible
  shearModulusClosed : E.shearModulusAdmissible
  bulkModulusClosed : E.bulkModulusAdmissible

def ElasticModuliClosed (E : ElasticModuliPackage) : Prop :=
  E.youngModulusAdmissible ∧ E.poissonRatioAdmissible ∧ E.shearModulusAdmissible ∧ E.bulkModulusAdmissible

theorem elastic_moduli_closed_from_evidence (E : ElasticModuliPackage) (Ev : ElasticModuliEvidence E) : ElasticModuliClosed E := by
  exact And.intro Ev.youngModulusClosed (And.intro Ev.poissonRatioClosed (And.intro Ev.shearModulusClosed Ev.bulkModulusClosed))

structure StressStrainPackage where
  stressTensor : ℝ → ℝ → ℝ
  strainTensor : ℝ → ℝ → ℝ
  constitutiveLaw : Prop
  yieldCriterion : ℝ → Prop
  plasticFlowRule : Prop
  hardeningLaw : ℝ → ℝ
  viscoelasticParameters : ℝ × ℝ × ℝ
  constitutiveLawAdmissible : constitutiveLaw
  yieldCriterionAdmissible : ∀ s : ℝ, yieldCriterion s → s > 0
  plasticFlowRuleAdmissible : plasticFlowRule
  hardeningLawAdmissible : ∀ ε > 0, hardeningLaw ε ≥ 0
  viscoelasticParametersAdmissible : viscoelasticParameters.1 > 0 ∧ viscoelasticParameters.2 > 0 ∧ viscoelasticParameters.3 ≥ 0

structure StressStrainEvidence (S : StressStrainPackage) where
  constitutiveLawClosed : S.constitutiveLawAdmissible
  yieldCriterionClosed : S.yieldCriterionAdmissible
  plasticFlowRuleClosed : S.plasticFlowRuleAdmissible
  hardeningLawClosed : S.hardeningLawAdmissible
  viscoelasticParametersClosed : S.viscoelasticParametersAdmissible

def StressStrainClosed (S : StressStrainPackage) : Prop :=
  S.constitutiveLawAdmissible ∧ S.yieldCriterionAdmissible ∧
  S.plasticFlowRuleAdmissible ∧ S.hardeningLawAdmissible ∧ S.viscoelasticParametersAdmissible

theorem stress_strain_closed_from_evidence (S : StressStrainPackage) (Ev : StressStrainEvidence S) : StressStrainClosed S := by
  exact And.intro Ev.constitutiveLawClosed
    (And.intro Ev.yieldCriterionClosed
      (And.intro Ev.plasticFlowRuleClosed
        (And.intro Ev.hardeningLawClosed Ev.viscoelasticParametersClosed)))

structure FractureToughnessPackage (E : ElasticModuliPackage) where
  criticalStressIntensityFactor : ℝ
  fractureEnergy : ℝ
  crackLength : ℝ
  stressIntensityFactor : ℝ → ℝ
  parisLawExponent : ℝ
  parisLawCoefficient : ℝ
  criticalStressIntensityFactorAdmissible : criticalStressIntensityFactor > 0
  fractureEnergyAdmissible : fractureEnergy > 0
  crackLengthAdmissible : crackLength ≥ 0
  stressIntensityFactorAdmissible : ∀ a ≥ 0, stressIntensityFactor a ≥ 0
  parisLawExponentAdmissible : parisLawExponent > 0
  parisLawCoefficientAdmissible : parisLawCoefficient > 0

structure FractureToughnessEvidence {E : ElasticModuliPackage} (F : FractureToughnessPackage E) where
  criticalStressIntensityFactorClosed : F.criticalStressIntensityFactorAdmissible
  fractureEnergyClosed : F.fractureEnergyAdmissible
  crackLengthClosed : F.crackLengthAdmissible
  stressIntensityFactorClosed : F.stressIntensityFactorAdmissible
  parisLawExponentClosed : F.parisLawExponentAdmissible
  parisLawCoefficientClosed : F.parisLawCoefficientAdmissible

def FractureToughnessClosed {E : ElasticModuliPackage} (F : FractureToughnessPackage E) : Prop :=
  F.criticalStressIntensityFactorAdmissible ∧ F.fractureEnergyAdmissible ∧
  F.crackLengthAdmissible ∧ F.stressIntensityFactorAdmissible ∧
  F.parisLawExponentAdmissible ∧ F.parisLawCoefficientAdmissible

theorem fracture_toughness_closed_from_evidence {E : ElasticModuliPackage} (F : FractureToughnessPackage E) (Ev : FractureToughnessEvidence F) : FractureToughnessClosed F := by
  exact And.intro Ev.criticalStressIntensityFactorClosed
    (And.intro Ev.fractureEnergyClosed
      (And.intro Ev.crackLengthClosed
        (And.intro Ev.stressIntensityFactorClosed
          (And.intro Ev.parisLawExponentClosed Ev.parisLawCoefficientClosed))))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse