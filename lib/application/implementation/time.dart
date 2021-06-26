import 'dart:math';

class Time {
  final int projectType;
  final List<double> effortList;

  Time({
    required this.projectType,
    required this.effortList,
  });

  List<double> calculateTime() {
    const List<List<double>> timeFactors = [
      [2.5, 0.38],
      [2.5, 0.35],
      [2.5, 0.32]
    ];
    List<double> timeList = [
      timeFactors[projectType][0] *
          pow(effortList[0], timeFactors[projectType][1]),
      timeFactors[projectType][0] *
          pow(effortList[1], timeFactors[projectType][1]),
      timeFactors[projectType][0] *
          pow(effortList[2], timeFactors[projectType][1])
    ];

    return timeList;
  }
}
