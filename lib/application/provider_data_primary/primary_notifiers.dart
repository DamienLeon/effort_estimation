import 'package:flutter/cupertino.dart';
import 'package:software_estimation/data/class_data/primary/project.dart';
import 'package:software_estimation/data/class_data/primary/project_block.dart';

// Project

class ProjectNameTextFieldData extends ChangeNotifier {
  String data = "";

  void setData(String inputData) {
    data = inputData;
    notifyListeners();
  }
}

class ProjectsScreenData extends ChangeNotifier {
  List<Project> projectsList = new List.empty(growable: true);

  void addProject(Project project) {
    projectsList.add(project);
    notifyListeners();
  }

  void removeProject(Object project) {
    projectsList.remove(project);
    notifyListeners();
  }

  void removeChild(int currentProjectIndex, int currentChildIndex) {
    projectsList[currentProjectIndex]
        .projectChildren
        .removeAt(currentChildIndex);
    notifyListeners();
  }

  void calculateTotalValues(int currentProjectIndex) {
    projectsList[currentProjectIndex].projectEffort = 0;
    projectsList[currentProjectIndex].projectTime = 0;

    for (ProjectBlock block
        in projectsList[currentProjectIndex].projectChildren) {
      projectsList[currentProjectIndex].projectEffort =
          projectsList[currentProjectIndex].projectEffort + block.effortList[1];
      projectsList[currentProjectIndex].projectTime =
          projectsList[currentProjectIndex].projectTime + block.timeList[1];
    }
    notifyListeners();
  }
}

class CurrentProjectSelectedData extends ChangeNotifier {
  int currentProject = 0;

  void setCurrentProject(int selectedProject) {
    currentProject = selectedProject;
    notifyListeners();
  }
}

class BlockListData extends ChangeNotifier {
  List<ProjectBlock> blockList = new List.empty(growable: true);

  void addBlock(ProjectBlock block) {
    blockList.add(block);
    notifyListeners();
  }
}

class BlockNameTextFieldData extends ChangeNotifier {
  String data = "";

  void setData(String inputData) {
    data = inputData;
    notifyListeners();
  }
}
