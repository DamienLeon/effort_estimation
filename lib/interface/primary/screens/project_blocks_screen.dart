import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_primary/primary_providers.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/interface/primary/models/block.dart';
import 'package:software_estimation/interface/primary/models/custom_floating_button.dart';
import 'package:software_estimation/interface/secondary/screens/fp_input_primary.dart';

class ProjectBlocksScreen extends StatelessWidget {
  static String route = 'home_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer(builder: (context, watch, child) {
          final selectedProjectName = watch(currentProjectProvider);
          final project = watch(projectsListProvider);
          return Text(project
              .projectsList[selectedProjectName.currentProject].projectName);
        }),
      ),
      body: Consumer(builder: (context, watch, child) {
        final project = watch(projectsListProvider);
        final currentProject = watch(currentProjectProvider);
        final blocks = watch(projectsListProvider);
        final projectChildren = watch(projectsListProvider)
            .projectsList[currentProject.currentProject]
            .projectChildren;
        return SafeArea(
          child: projectChildren.length == 0
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No blocks added to ${project.projectsList[currentProject.currentProject].projectName}',
                        style: kTextSpanInactiveStyle,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Click on ',
                              style: kTextSpanInactiveStyle,
                              children: [
                                TextSpan(
                                    text: 'New Project Block',
                                    style: kTextSpanActiveStyle),
                                TextSpan(
                                  text: ' to add a new Project Block',
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                )
              : Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Project Effort:", style: kLabelStyle),
                              Text(
                                  "${blocks.projectsList[currentProject.currentProject].projectEffort.toStringAsPrecision(4)} person months",
                                  style: kLabelStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total Project Time:", style: kLabelStyle),
                              Text(
                                  "${blocks.projectsList[currentProject.currentProject].projectTime.toStringAsPrecision(3)} months",
                                  style: kLabelStyle),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Number of Blocks Added:",
                                  style: kLabelStyle),
                              Text(projectChildren.length.toString(),
                                  style: kLabelStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 15, left: 10, right: 10, bottom: 55),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: ListView.builder(
                          itemCount: projectChildren.length,
                          // blocks.projectsList[currentProject.currentProject].projectChildren.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (
                                //blocks.projectsList[currentProject.currentProject].projectChildren.length
                                projectChildren.length == 0)
                              // TODO: Add description text
                              return SizedBox(
                                height: 0,
                              );
                            else
                              return Block(
                                blockName: projectChildren[index].blockName,
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].blockName,
                                onPressed: () {},
                                deleteBlock: () {
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Delete the data related to ${projectChildren[index].blockName}?. All data related to this block will be lost.",
                                                    style: kTextFieldStyle,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            Color(0xff004d40),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    15))),
                                                    child: TextButton(
                                                      onPressed: () {
                                                        context
                                                            .read(
                                                                projectsListProvider)
                                                            .removeChild(
                                                                currentProject
                                                                    .currentProject,
                                                                index);
                                                        context
                                                            .read(
                                                                projectsListProvider)
                                                            .calculateTotalValues(context
                                                                .read(
                                                                    currentProjectProvider)
                                                                .currentProject);
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
                                  // FIXME : Currently not watching project children list. Only project List.
                                },
                                effort: projectChildren[index]
                                    .effortList[1]
                                    .toStringAsPrecision(4),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].effortList[1].toStringAsPrecision(4),
                                effortLow: projectChildren[index]
                                    .effortList[0]
                                    .toStringAsPrecision(4),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].effortList[0].toStringAsPrecision(4),
                                effortHigh: projectChildren[index]
                                    .effortList[2]
                                    .toStringAsPrecision(4),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].effortList[2].toStringAsPrecision(4),
                                time: projectChildren[index]
                                    .timeList[1]
                                    .toStringAsPrecision(3),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].timeList[1].toStringAsPrecision(3),
                                timeLow: projectChildren[index]
                                    .timeList[0]
                                    .toStringAsPrecision(3),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].timeList[0].toStringAsPrecision(3),
                                timeHigh: projectChildren[index]
                                    .timeList[2]
                                    .toStringAsPrecision(3),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].timeList[2].toStringAsPrecision(3),
                                personsReq: projectChildren[index]
                                    .personsRequired
                                    .toString(),
                                //blocks.projectsList[currentProject.currentProject].projectChildren[index].personsRequired.toString(),
                              );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        );
      }),
      floatingActionButton: CustomFloatingButton(
        primaryTitle: "New Project Block",
        dialogTitle: "Create Block",
        textFieldOnPressed: (value) {
          context.read(blockNameProvider).setData(value);
        },
        onPressed: () {
          Navigator.pushNamed(context, FPInputScreen.route);
        },
      ),
    );
  }
}
