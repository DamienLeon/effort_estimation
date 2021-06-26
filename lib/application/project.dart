import 'package:software_estimation/application/project_block.dart';

class Project {
  final String projectName;
  double projectEffort;
  double projectTime;
  List<ProjectBlock> projectChildren;

  Project(this.projectName, this.projectEffort, this.projectTime,
      this.projectChildren);
}
