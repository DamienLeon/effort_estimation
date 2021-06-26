import 'package:flutter/cupertino.dart';
import 'package:software_estimation/resources/effort_input/secondary.dart';
import 'package:software_estimation/resources/fp_input/primary.dart';

class ExternalInputData extends ChangeNotifier {
  int data = 0;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ExternalOutputData extends ChangeNotifier {
  int data = 0;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ExternalInquiryData extends ChangeNotifier {
  int data = 0;

  void setData(inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ExternalInterfaceFileData extends ChangeNotifier {
  int data = 0;

  void setData(inputData) {
    data = inputData;
    notifyListeners();
  }
}

class InternalLogicalFileData extends ChangeNotifier {
  int data = 0;

  void setData(inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ProjectComplexityData extends ChangeNotifier {
  int data = 1;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ComplexityFactorsData extends ChangeNotifier {
  List<double> complexityValuesList = new List.filled(kAspects.length, 2);

  void setData(double inputData, int index) {
    complexityValuesList[index] = inputData;
    notifyListeners();
  }
}

class LanguageSelectedData extends ChangeNotifier {
  String data = "ABAP (SAP)";

  void setData(String inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ProjectTypeData extends ChangeNotifier {
  int data = 3;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ProductAttributesData extends ChangeNotifier {
  List<double> attributeValuesList =
      new List.filled(kProductAttributeValues.length, 1);
  List<String> attributeLabelList =
      new List.filled(kProductAttributeValues.length, "Nominal");

  void setData(double inputValueData, String inputLabelData, int index) {
    attributeValuesList[index] = inputValueData;
    attributeLabelList[index] = inputLabelData;
    notifyListeners();
  }

  double getCAF() {
    double caf = 1;
    for (int i = 0; i < attributeValuesList.length; i++) {
      caf = caf * attributeValuesList[i];
    }
    return caf;
  }
}

class HardwareAttributesData extends ChangeNotifier {
  List<double> attributeValuesList =
      new List.filled(kHardwareAttributeValues.length, 1);
  List<String> attributeLabelList =
      new List.filled(kHardwareAttributeValues.length, "Nominal");

  void setData(double inputValueData, String inputLabelData, int index) {
    attributeValuesList[index] = inputValueData;
    attributeLabelList[index] = inputLabelData;
    notifyListeners();
  }

  double getCAF() {
    double caf = 1;
    for (int i = 0; i < attributeValuesList.length; i++) {
      caf = caf * attributeValuesList[i];
    }
    return caf;
  }
}

class PersonalAttributesData extends ChangeNotifier {
  List<double> attributeValuesList =
      new List.filled(kPersonalAttributeValues.length, 1);
  List<String> attributeLabelList =
      new List.filled(kPersonalAttributeValues.length, "Nominal");

  void setData(double inputValueData, String inputLabelData, int index) {
    attributeValuesList[index] = inputValueData;
    attributeLabelList[index] = inputLabelData;
    notifyListeners();
  }

  double getCAF() {
    double caf = 1;
    for (int i = 0; i < attributeValuesList.length; i++) {
      caf = caf * attributeValuesList[i];
    }
    return caf;
  }
}

class ProjectAttributesData extends ChangeNotifier {
  List<double> attributeValuesList =
      new List.filled(kProjectAttributeValues.length, 1);
  List<String> attributeLabelList =
      new List.filled(kProjectAttributeValues.length, "Nominal");

  void setData(double inputValueData, String inputLabelData, int index) {
    attributeValuesList[index] = inputValueData;
    attributeLabelList[index] = inputLabelData;
    notifyListeners();
  }

  double getCAF() {
    double caf = 1;
    for (int i = 0; i < attributeValuesList.length; i++) {
      caf = caf * attributeValuesList[i];
    }
    return caf;
  }
}

class FunctionPointsData extends ChangeNotifier {
  double data = 0;

  void setData(double inputData) {
    data = inputData;
    notifyListeners();
  }
}

class EffortData extends ChangeNotifier {
  List<double> effortData = [0, 0, 0];

  void setData(List<double> inputList) {
    effortData[0] = inputList[0]; // Effort Low
    effortData[1] = inputList[1]; // Effort Median
    effortData[2] = inputList[2]; // Effort High
    notifyListeners();
  }
}

class TimeData extends ChangeNotifier {
  List<double> timeData = [0, 0, 0];

  void setData(List<double> inputList) {
    timeData[0] = inputList[0]; // Time Low
    timeData[1] = inputList[1]; // Time Median
    timeData[2] = inputList[2]; // Time High
    notifyListeners();
  }
}
