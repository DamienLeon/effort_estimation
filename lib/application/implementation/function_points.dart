class FunctionPointCalculation {
  final int ei;
  final int eo;
  final int eq;
  final int eif;
  final int ilf;
  final int complexity;
  final List<double> complexityFactors;

  FunctionPointCalculation(this.ei, this.eo, this.eq, this.eif, this.ilf,
      this.complexity, this.complexityFactors);

  double calculate() {
    int unadjustedFunctionPoints = 0;

    List<int> parameters = [ei, eo, eq, eif, ilf];

    List<List<int>> weights = [
      [3, 4, 3, 5, 7],
      [4, 5, 4, 7, 10],
      [6, 7, 6, 10, 15],
    ];

    for (int i = 0; i < 1; i++) {
      for (int j = 0; j < 5; j++) {
        unadjustedFunctionPoints =
            unadjustedFunctionPoints + parameters[j] * weights[complexity][j];
      }
    }

    double factorValue = 0;
    for (int fac = 0; fac < complexityFactors.length; fac++) {
      factorValue += complexityFactors[fac];
    }

    double complexityAdjustmentFactor = 0.65 + (0.01 * factorValue);

    double functionPoints =
        unadjustedFunctionPoints * complexityAdjustmentFactor;

    return functionPoints;
  }
}
