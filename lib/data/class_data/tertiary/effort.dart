import 'dart:math';

class Effort {
  final int projectType;
  final List<double> klocList;
  final double complexityAdjustmentFactor;

  Effort(
      {required this.projectType,
      required this.klocList,
      required this.complexityAdjustmentFactor});

  List<double> calculateEffort() {
    const List<List<double>> effortFactors = [
      [3.2, 1.05],
      [3, 1.12],
      [2.8, 1.2]
    ];
    List<double> effortList = [
      effortFactors[projectType][0] *
          pow(klocList[0], effortFactors[projectType][1]) *
          complexityAdjustmentFactor,
      effortFactors[projectType][0] *
          pow(klocList[1], effortFactors[projectType][1]) *
          complexityAdjustmentFactor,
      effortFactors[projectType][0] *
          pow(klocList[2], effortFactors[projectType][1]) *
          complexityAdjustmentFactor
    ];

    return effortList;
  }
}
