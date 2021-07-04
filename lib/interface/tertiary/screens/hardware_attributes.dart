import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_tertiary/tertiary_providers.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/data/resources/effort_input/secondary.dart';
import 'package:software_estimation/interface/tertiary/models/secondary/attribute_radio_tile.dar.dart';
import 'package:software_estimation/interface/tertiary/models/secondary/attributes.dart';
import 'package:software_estimation/interface/tertiary/screens/personal_attributes.dart';

class HardwareAttributesScreen extends StatelessWidget {
  static const String route = 'hardware_attribute_screen';

  final List<List<double>> hardwareAttributesValues = new List.generate(
    kHardwareAttributeValues.length,
    (index) => getAttributeValuesList(kHardwareAttributeValues, index),
  );

  final List<List<String>> hardwareAttributesLabels = new List.generate(
    kHardwareAttributeValues.length,
    (index) => getAttributeLabelsList(kHardwareAttributeValues, index),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hardware Attributes"),
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
                  final hardwareAttribute = watch(hardwareAttributesProvider);
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: hardwareAttributesValues.length,
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
                                  kHardwareAttributes[topIndex],
                                  style: kLabelStyle,
                                ),
                                ListView.builder(
                                  physics: ClampingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      hardwareAttributesValues[topIndex].length,
                                  itemBuilder:
                                      (BuildContext context, int bottomIndex) {
                                    return AttributeRadioTile(
                                      color: hardwareAttribute
                                                      .attributeLabelList[
                                                  topIndex] ==
                                              hardwareAttributesLabels[topIndex]
                                                  [bottomIndex]
                                          ? kActiveColor
                                          : kInactiveColor,
                                      icon: hardwareAttribute
                                                      .attributeLabelList[
                                                  topIndex] ==
                                              hardwareAttributesLabels[topIndex]
                                                  [bottomIndex]
                                          ? Icons.radio_button_checked
                                          : Icons.radio_button_unchecked,
                                      selectedFactor:
                                          hardwareAttributesLabels[topIndex]
                                              [bottomIndex],
                                      attributeFactorLabel:
                                          hardwareAttributesLabels[topIndex]
                                              [bottomIndex],
                                      onRadioSelected: () {
                                        context
                                            .read(hardwareAttributesProvider)
                                            .setData(
                                                hardwareAttributesValues[
                                                    topIndex][bottomIndex],
                                                hardwareAttributesLabels[
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
            print(context.read(hardwareAttributesProvider).attributeValuesList);
            Navigator.pushNamed(context, PersonalAttributesScreen.route);
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
