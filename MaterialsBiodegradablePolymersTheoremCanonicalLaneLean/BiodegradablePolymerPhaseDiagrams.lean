import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiodegradablePolymersTheoremCanonicalLaneLean

structure CrystallinityPackage where
  polymerMatrix : Type u
  lamellarThickness : ℝ
  crystallineFraction : ℝ
  spheruliteRadius : ℝ
  nucleationDensity : ℝ
  growthRate : ℝ
  meltingTemperature : ℝ
  glassTransitionTemperature : ℝ
  avramiExponent : ℝ
  halfLifeCrystallization : ℝ
  temperatureDependent : ℝ → ℝ
  lamellarThicknessAdmissible : lamellarThickness > 0
  crystallineFractionAdmissible : crystallineFraction ≥ 0 ∧ crystallineFraction ≤ 1
  spheruliteRadiusAdmissible : spheruliteRadius ≥ 0
  nucleationDensityAdmissible : nucleationDensity ≥ 0
  growthRateAdmissible : growthRate > 0
  meltingTemperatureAdmissible : meltingTemperature > 0
  glassTransitionTemperatureAdmissible : glassTransitionTemperature > 0
  avramiExponentAdmissible : avramiExponent ∈ Set.Ioo (0 : ℝ) 4
  halfLifeCrystallizationAdmissible : halfLifeCrystallization > 0

structure CrystallinityEvidence (C : CrystallinityPackage) where
  lamellarThicknessClosed : C.lamellarThicknessAdmissible
  crystallineFractionClosed : C.crystallineFractionAdmissible
  spheruliteRadiusClosed : C.spheruliteRadiusAdmissible
  nucleationDensityClosed : C.nucleationDensityAdmissible
  growthRateClosed : C.growthRateAdmissible
  meltingTemperatureClosed : C.meltingTemperatureAdmissible
  glassTransitionTemperatureClosed : C.glassTransitionTemperatureAdmissible
  avramiExponentClosed : C.avramiExponentAdmissible
  halfLifeCrystallizationClosed : C.halfLifeCrystallizationAdmissible

def CrystallinityClosed (C : CrystallinityPackage) : Prop :=
  C.lamellarThicknessAdmissible ∧ C.crystallineFractionAdmissible ∧
  C.spheruliteRadiusAdmissible ∧ C.nucleationDensityAdmissible ∧
  C.growthRateAdmissible ∧ C.meltingTemperatureAdmissible ∧
  C.glassTransitionTemperatureAdmissible ∧ C.avramiExponentAdmissible ∧
  C.halfLifeCrystallizationAdmissible

theorem crystallinity_closed_from_evidence (C : CrystallinityPackage) (E : CrystallinityEvidence C) : CrystallinityClosed C := by
  exact And.intro E.lamellarThicknessClosed
    (And.intro E.crystallineFractionClosed
      (And.intro E.spheruliteRadiusClosed
        (And.intro E.nucleationDensityClosed
          (And.intro E.growthRateClosed
            (And.intro E.meltingTemperatureClosed
              (And.intro E.glassTransitionTemperatureClosed
                (And.intro E.avramiExponentClosed E.halfLifeCrystallizationClosed)))))))

structure PhaseDiagramPackage (C : CrystallinityPackage) where
  temperatureCompositionDomain : Set (ℝ × ℝ)
  miscibilityGap : Set (ℝ × ℝ)
  binodalCurve : ℝ → ℝ
  spinodalCurve : ℝ → ℝ
  crystallinePhaseBoundary : ℝ → ℝ
  amorphousPhaseBoundary : ℝ → ℝ
  eutecticPoint : ℝ × ℝ
  meltingPointDepression : ℝ → ℝ
  floryHugginsParameter : ℝ
  phaseBoundarySmooth : Prop
  eutecticPointAdmissible : eutecticPoint.1 > 0 ∧ eutecticPoint.2 > 0 ∧ eutecticPoint.2 < 1
  meltingPointDepressionAdmissible : ∀ x > 0, meltingPointDepression x > 0
  floryHugginsParameterAdmissible : floryHugginsParameter > 0
  phaseBoundarySmoothAdmissible : phaseBoundarySmooth

structure PhaseDiagramEvidence {C : CrystallinityPackage} (P : PhaseDiagramPackage C) where
  eutecticPointClosed : P.eutecticPointAdmissible
  meltingPointDepressionClosed : P.meltingPointDepressionAdmissible
  floryHugginsParameterClosed : P.floryHugginsParameterAdmissible
  phaseBoundarySmoothClosed : P.phaseBoundarySmoothAdmissible

def PhaseDiagramClosed {C : CrystallinityPackage} (P : PhaseDiagramPackage C) : Prop :=
  P.eutecticPointAdmissible ∧ P.meltingPointDepressionAdmissible ∧
  P.floryHugginsParameterAdmissible ∧ P.phaseBoundarySmoothAdmissible

theorem phase_diagram_closed_from_evidence {C : CrystallinityPackage} (P : PhaseDiagramPackage C) (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.eutecticPointClosed
    (And.intro E.meltingPointDepressionClosed
      (And.intro E.floryHugginsParameterClosed E.phaseBoundarySmoothClosed))

structure DegradationKineticsPackage (C : CrystallinityPackage) where
  hydrolysisRate : ℝ
  enzymaticDegradationRate : ℝ
  diffusionCoefficient : ℝ
  erosionFrontVelocity : ℝ
  molecularWeightLossHalfLife : ℝ
  pH : ℝ
  temperature : ℝ
  hydrolysisRateAdmissible : hydrolysisRate > 0
  enzymaticDegradationRateAdmissible : enzymaticDegradationRate ≥ 0
  diffusionCoefficientAdmissible : diffusionCoefficient > 0
  erosionFrontVelocityAdmissible : erosionFrontVelocity ≥ 0
  molecularWeightLossHalfLifeAdmissible : molecularWeightLossHalfLife > 0
  pHAdmissible : pH ≥ 0 ∧ pH ≤ 14
  temperatureAdmissible : temperature > 0

structure DegradationKineticsEvidence {C : CrystallinityPackage} (D : DegradationKineticsPackage C) where
  hydrolysisRateClosed : D.hydrolysisRateAdmissible
  enzymaticDegradationRateClosed : D.enzymaticDegradationRateAdmissible
  diffusionCoefficientClosed : D.diffusionCoefficientAdmissible
  erosionFrontVelocityClosed : D.erosionFrontVelocityAdmissible
  molecularWeightLossHalfLifeClosed : D.molecularWeightLossHalfLifeAdmissible
  pHClosed : D.pHAdmissible
  temperatureClosed : D.temperatureAdmissible

def DegradationKineticsClosed {C : CrystallinityPackage} (D : DegradationKineticsPackage C) : Prop :=
  D.hydrolysisRateAdmissible ∧ D.enzymaticDegradationRateAdmissible ∧
  D.diffusionCoefficientAdmissible ∧ D.erosionFrontVelocityAdmissible ∧
  D.molecularWeightLossHalfLifeAdmissible ∧ D.pHAdmissible ∧ D.temperatureAdmissible

theorem degradation_kinetics_closed_from_evidence {C : CrystallinityPackage} (D : DegradationKineticsPackage C) (E : DegradationKineticsEvidence D) : DegradationKineticsClosed D := by
  exact And.intro E.hydrolysisRateClosed
    (And.intro E.enzymaticDegradationRateClosed
      (And.intro E.diffusionCoefficientClosed
        (And.intro E.erosionFrontVelocityClosed
          (And.intro E.molecularWeightLossHalfLifeClosed
            (And.intro E.pHClosed E.temperatureClosed)))))

end MaterialsBiodegradablePolymersTheoremCanonicalLaneLean
end HautevilleHouse