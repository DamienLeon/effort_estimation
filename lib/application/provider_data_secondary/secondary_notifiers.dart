import 'package:flutter/cupertino.dart';
import 'package:software_estimation/data/resources/fp_input/primary.dart';

class ExternalInputData extends ChangeNotifier {
  int data = 0;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }

  void resetData() {
    data = 0;
  }
}

class ExternalOutputData extends ChangeNotifier {
  int data = 0;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }

  void resetData() {
    data = 0;
  }
}

class ExternalInquiryData extends ChangeNotifier {
  int data = 0;

  void setData(inputData) {
    data = inputData;
    notifyListeners();
  }

  void resetData() {
    data = 0;
  }
}

class ExternalInterfaceFileData extends ChangeNotifier {
  int data = 0;

  void setData(inputData) {
    data = inputData;
    notifyListeners();
  }

  void resetData() {
    data = 0;
  }
}

class InternalLogicalFileData extends ChangeNotifier {
  int data = 0;

  void setData(inputData) {
    data = inputData;
    notifyListeners();
  }

  void resetData() {
    data = 0;
  }
}

class ProjectComplexityData extends ChangeNotifier {
  int data = 1;

  void setData(int inputData) {
    data = inputData;
    notifyListeners();
  }

  void resetData() {
    data = 1;
  }
}

class ComplexityFactorsData extends ChangeNotifier {
  List<double> complexityValuesList = new List.filled(kAspects.length, 2);

  void setData(double inputData, int index) {
    complexityValuesList[index] = inputData;
    notifyListeners();
  }

  void resetData() {
    for (int item = 0; item < complexityValuesList.length; item++) {
      complexityValuesList[item] = 2;
    }
  }
}
