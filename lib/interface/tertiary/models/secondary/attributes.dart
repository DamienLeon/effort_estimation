const List<String> kAttributeValueFactors = [
  "Very Low",
  "Low",
  "Nominal",
  "High",
  "Very High",
  "Extra High"
];

List<double> getAttributeValuesList(List valueList, int index) {
  List<double> attributeValueList = new List.empty(growable: true);
  for (int i = index; i < index + 1; i++) {
    for (int j = 0; j < 6; j++) {
      if (valueList[i][j] == 0.0) {
        continue;
      } else {
        attributeValueList.add(valueList[i][j]);
      }
    }
  }
  return attributeValueList;
}

List<String> getAttributeLabelsList(List valueList, int index) {
  List<String> attributeLabelList = new List.empty(growable: true);
  for (int i = index; i < index + 1; i++) {
    for (int j = 0; j < 6; j++) {
      if (valueList[i][j] == 0.0) {
        continue;
      } else {
        attributeLabelList.add(kAttributeValueFactors[j]);
      }
    }
  }
  return attributeLabelList;
}
