import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_tertiary/tertiary_providers.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/data/resources/effort_input/primary.dart';
import 'package:software_estimation/interface/tertiary/models/primary/custom_dropdown_menu.dart';
import 'package:software_estimation/interface/tertiary/models/primary/project_type_radio.dart';
import 'package:software_estimation/interface/tertiary/screens/product_attributes.dart';

class EffortPrimaryScreen extends StatelessWidget {
  static String route = 'effort_primary_screen';

  final List<String> languageNames = getString(tableReq, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Choose the language used from the list below",
                  style: kTitleStyle,
                ),
                Consumer(builder: (context, watch, child) {
                  final languageSelected = watch(languageSelectedProvider);
                  return CustomDropDownMenu(
                    dropdownValue: languageSelected.data,
                    dropdownItems: languageNames
                        .map<DropdownMenuItem<String>>((String value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    getLanguage: (String value) {
                      context.read(languageSelectedProvider).setData(value);
                    },
                  );
                }),
                kDivider1,
                Text(
                  "Select the project type",
                  style: kTitleStyle,
                ),
                Consumer(builder: (context, watch, child) {
                  final projectSelected = watch(projectTypeProvider);
                  return Column(
                    children: [
                      ProjectTypeRadio(
                          color: projectSelected.data == 0
                              ? kActiveColor
                              : kInactiveColor,
                          icon: projectSelected.data == 0
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          projectTypeLabel: "Organic",
                          onRadioSelected: () {
                            context.read(projectTypeProvider).setData(0);
                          }),
                      ProjectTypeRadio(
                          color: projectSelected.data == 1
                              ? kActiveColor
                              : kInactiveColor,
                          icon: projectSelected.data == 1
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          projectTypeLabel: "Semi-detached",
                          onRadioSelected: () {
                            context.read(projectTypeProvider).setData(1);
                          }),
                      ProjectTypeRadio(
                          color: projectSelected.data == 2
                              ? kActiveColor
                              : kInactiveColor,
                          icon: projectSelected.data == 2
                              ? Icons.radio_button_checked
                              : Icons.radio_button_off,
                          projectTypeLabel: "Embedded",
                          onRadioSelected: () {
                            context.read(projectTypeProvider).setData(2);
                          })
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            if (context.read(projectTypeProvider).data == 3)
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Choose the type of project",
                        style: kTextSpanActiveStyle,
                      ),
                    ),
                  ),
                ),
              );
            else
              Navigator.pushNamed(context, ProductAttributesScreen.route);
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
