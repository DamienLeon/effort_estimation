import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/globals.dart';
import 'package:software_estimation/models/effort_input/secondary/attribute_radio_tile.dar.dart';
import 'package:software_estimation/models/effort_input/secondary/attributes.dart';
import 'package:software_estimation/resources/effort_input/secondary.dart';
import 'package:software_estimation/application/providers.dart';
import 'package:software_estimation/screens/tertiary_screens/project_attributes.dart';

class PersonalAttributesScreen extends StatelessWidget {
  static String route = 'personal_attribute_screen';

  final List<List<double>> personalAttributesValues = new List.generate(
    kPersonalAttributeValues.length,
    (index) => getAttributeValuesList(kPersonalAttributeValues, index),
  );

  final List<List<String>> personalAttributesLabels = new List.generate(
    kPersonalAttributeValues.length,
    (index) => getAttributeLabelsList(kPersonalAttributeValues, index),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Attributes'),
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
                  final personalAttribute = watch(personalAttributesProvider);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: personalAttributesValues.length,
                    itemBuilder: (BuildContext context, int topIndex) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                  kPersonalAttributes[topIndex],
                                  style: kLabelStyle,
                                ),
                                ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      personalAttributesValues[topIndex].length,
                                  itemBuilder:
                                      (BuildContext context, int bottomIndex) {
                                    return AttributeRadioTile(
                                      color: personalAttribute
                                                      .attributeLabelList[
                                                  topIndex] ==
                                              personalAttributesLabels[topIndex]
                                                  [bottomIndex]
                                          ? kActiveColor
                                          : kInactiveColor,
                                      icon: personalAttribute
                                                      .attributeLabelList[
                                                  topIndex] ==
                                              personalAttributesLabels[topIndex]
                                                  [bottomIndex]
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      selectedFactor:
                                          personalAttributesLabels[topIndex]
                                              [bottomIndex],
                                      attributeFactorLabel:
                                          personalAttributesLabels[topIndex]
                                              [bottomIndex],
                                      onRadioSelected: () {
                                        context
                                            .read(personalAttributesProvider)
                                            .setData(
                                                personalAttributesValues[
                                                    topIndex][bottomIndex],
                                                personalAttributesLabels[
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
            print(context.read(personalAttributesProvider).attributeValuesList);
            Navigator.pushNamed(context, ProjectAttributesScreen.route);
          },
          child: Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
