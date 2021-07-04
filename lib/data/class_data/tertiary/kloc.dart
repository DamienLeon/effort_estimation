import 'package:software_estimation/data/resources/effort_input/primary.dart';

class KLOC {
  final String language;
  final double functionPoints;

  KLOC({
    required this.language,
    required this.functionPoints,
  });

  List<double> calculateKLOC() {
    List<String> medianValuesList = getString(tableReq, 2);
    List<String> lowValuesList = getString(tableReq, 3);
    List<String> highValuesList = getString(tableReq, 4);

    int index = getIndex(language);

    double lowValueKLOC =
        (functionPoints * int.parse(lowValuesList[index]) / 1000);
    double medianValueKLOC =
        (functionPoints * int.parse(medianValuesList[index]) / 1000);
    double highValueKLOC =
        (functionPoints * int.parse(highValuesList[index]) / 1000);

    List<double> listKLOC = [lowValueKLOC, medianValueKLOC, highValueKLOC];

    return listKLOC;
  }
}
