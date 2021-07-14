import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_primary/primary_providers.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/interface/primary/models/custom_floating_button.dart';
import 'package:software_estimation/data/class_data/primary/project.dart';
import 'project_blocks_screen.dart';

class ProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer(builder: (context, watch, child) {
        final projects = watch(projectsListProvider);
        return SafeArea(
          child: projects.projectsList.length == 0
              ? Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Click on ',
                      style: kTextSpanInactiveStyle,
                      children: [
                        TextSpan(
                          text: 'New Project',
                          style: kTextSpanActiveStyle,
                        ),
                        TextSpan(
                          text: ' to add a new Project',
                        ),
                      ],
                    ),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: projects.projectsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final obj = projects.projectsList[index];
                    return Container(
                      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xff004d40),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Expanded(
                              child: TextButton(
                                  child: Text(obj.projectName,
                                      style: kButtonStyle),
                                  onPressed: () {
                                    // Stores the index value of the current selected project
                                    context
                                        .read(currentProjectProvider)
                                        .setCurrentProject(index);
                                    //Goes to the project blocks screen
                                    Navigator.pushNamed(
                                        context, ProjectBlocksScreen.route);
                                  }),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            // Delete Project
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15)),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20),
                                          height: 200,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                "Delete the data related to ${obj.projectName}?. All data related to this project will be lost.",
                                                style: kTextFieldStyle,
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: Color(0xff004d40),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                child: TextButton(
                                                  onPressed: () {
                                                    context
                                                        .read(
                                                            projectsListProvider)
                                                        .removeProject(obj);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "Confirm",
                                                    style: kButtonStyle,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
        );
      }),
      floatingActionButton: CustomFloatingButton(
        primaryTitle: "New Project",
        dialogTitle: "Create Project",
        textFieldOnPressed: (value) {
          context.read(projectNameProvider).setData(value);
        },
        onPressed: () {
          final project =
              Project(context.read(projectNameProvider).data, 0, 0, []);
          context.read(projectsListProvider).addProject(project);
          Navigator.pop(context);
        },
      ),
    );
  }
}
