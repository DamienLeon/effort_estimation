import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/implementation/time.dart';
import 'package:software_estimation/application/implementation/effort.dart';
import 'package:software_estimation/application/implementation/kloc.dart';
import 'package:software_estimation/application/provider_data/primary/primary_providers.dart';
import 'package:software_estimation/globals.dart';
import 'package:software_estimation/models/effort_input/secondary/attribute_radio_tile.dar.dart';
import 'package:software_estimation/models/effort_input/secondary/attributes.dart';
import 'package:software_estimation/application/project_block.dart';
import 'package:software_estimation/resources/effort_input/secondary.dart';
import 'package:software_estimation/application/providers.dart';

class ProjectAttributesScreen extends StatelessWidget {
  static String route = 'project_attribute_screen';

  final List<List<double>> projectAttributesValues = new List.generate(
    kProjectAttributeValues.length,
    (index) => getAttributeValuesList(kProjectAttributeValues, index),
  );

  final List<List<String>> projectAttributesLabels = new List.generate(
    kProjectAttributeValues.length,
    (index) => getAttributeLabelsList(kProjectAttributeValues, index),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Attributes"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Text(
                "Rate the attributes according to given scale:",
                style: kTitleStyle,
              ),
              Consumer(
                builder: (context, watch, child) {
                  final projectAttribute = watch(projectAttributesProvider);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: projectAttributesValues.length,
                    itemBuilder: (BuildContext context, int topIndex) {
                      return Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            padding:
                                EdgeInsets.only(left: 15, right: 15, top: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: kBorderRadius15,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kProjectAttributes[topIndex],
                                  style: kLabelStyle,
                                ),
                                ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      projectAttributesValues[topIndex].length,
                                  itemBuilder:
                                      (BuildContext context, int bottomIndex) {
                                    return AttributeRadioTile(
                                      color: projectAttribute
                                                      .attributeLabelList[
                                                  topIndex] ==
                                              projectAttributesLabels[topIndex]
                                                  [bottomIndex]
                                          ? kActiveColor
                                          : kInactiveColor,
                                      icon: projectAttribute.attributeLabelList[
                                                  topIndex] ==
                                              projectAttributesLabels[topIndex]
                                                  [bottomIndex]
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      selectedFactor:
                                          projectAttributesLabels[topIndex]
                                              [bottomIndex],
                                      attributeFactorLabel:
                                          projectAttributesLabels[topIndex]
                                              [bottomIndex],
                                      onRadioSelected: () {
                                        context
                                            .read(projectAttributesProvider)
                                            .setData(
                                                projectAttributesValues[
                                                    topIndex][bottomIndex],
                                                projectAttributesLabels[
                                                    topIndex][bottomIndex],
                                                topIndex);
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          kDivider1,
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            print(context.read(projectAttributesProvider).attributeValuesList);

            List<double> klocList = KLOC(
              language: context.read(languageSelectedProvider).data,
              functionPoints: context.read(functionPointsProvider).data,
            ).calculateKLOC();

            double caf = context.read(productAttributesProvider).getCAF() *
                context.read(hardwareAttributesProvider).getCAF() *
                context.read(personalAttributesProvider).getCAF() *
                context.read(projectAttributesProvider).getCAF();

            print(caf);

            List<double> effortList = Effort(
                    projectType: context.read(projectTypeProvider).data,
                    klocList: klocList,
                    complexityAdjustmentFactor: caf)
                .calculateEffort();

            context.read(effortProvider).setData(effortList);

            List<double> timeList = Time(
              projectType: context.read(projectTypeProvider).data,
              effortList: effortList,
            ).calculateTime();

            context.read(timeProvider).setData(timeList);

            int personsReq = (effortList[1] / timeList[1]).round();

            final projectBlock = new ProjectBlock(
                context.read(blockNameProvider).data,
                effortList,
                timeList,
                personsReq);

            context.read(blocksListProvider).addBlock(projectBlock);

            //Adds the new block to project children list
            context
                .read(projectsListProvider)
                .projectsList[
                    context.read(currentProjectProvider).currentProject]
                .projectChildren
                .add(projectBlock);

            context.read(projectsListProvider).calculateTotalValues(
                context.read(currentProjectProvider).currentProject);

            // TODO : Go to ProjectBlock Screen
            Navigator.popUntil(context, (_) => _.isFirst);
            // Navigator.pushNamed(context, ResultsPage.route);
          },
          child: Text(
            "Calculate",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
