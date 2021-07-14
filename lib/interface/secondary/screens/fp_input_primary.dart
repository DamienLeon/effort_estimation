import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_secondary/secondary_providers.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/interface/secondary/models/complexity_input_button.dart';
import 'package:software_estimation/interface/secondary/models/primary_input_button.dart';

import 'fp_input_secondary.dart';

class FPInputScreen extends StatelessWidget {
  static const String route = 'fp_input_screen';

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
                  "Transactional Functions:",
                  style: kTitleStyle,
                ),
                PrimaryInputButton(
                  buttonTitle: "External Inputs",
                  setData: (value) {
                    context
                        .read(externalInputProvider)
                        .setData(int.parse(value));
                  },
                ),
                PrimaryInputButton(
                  buttonTitle: "External Outputs",
                  setData: (value) {
                    context
                        .read(externalOutputProvider)
                        .setData(int.parse(value));
                  },
                ),
                PrimaryInputButton(
                  buttonTitle: "External Inquiries",
                  setData: (value) {
                    context
                        .read(externalInquiryProvider)
                        .setData(int.parse(value));
                  },
                ),
                kDivider1,
                Text(
                  "Data Functions:",
                  style: kTitleStyle,
                ),
                PrimaryInputButton(
                  buttonTitle: "External Interface Files",
                  setData: (value) {
                    context
                        .read(externalInterfaceFileProvider)
                        .setData(int.parse(value));
                  },
                ),
                PrimaryInputButton(
                  buttonTitle: "Internal Logical Files",
                  setData: (value) {
                    context
                        .read(internalLogicalFileProvider)
                        .setData(int.parse(value));
                  },
                ),
                kDivider1,
                Text(
                  "Choose the complexity:",
                  style: kTitleStyle,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      borderRadius: kBorderRadius15, color: Colors.white),
                  child: Consumer(builder: (context, watch, child) {
                    final complexityValue =
                        watch(projectComplexityDataProvider);
                    return Row(
                      children: [
                        ComplexityInputButton(
                          complexityText: "Low",
                          color: complexityValue.data == 0
                              ? kActiveLow
                              : kInactiveColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          setComplexity: () {
                            context
                                .read(projectComplexityDataProvider)
                                .setData(0);
                          },
                        ),
                        ComplexityInputButton(
                          complexityText: "Average",
                          borderRadius: BorderRadius.zero,
                          color: complexityValue.data == 1
                              ? kActiveAverage
                              : kInactiveColor,
                          setComplexity: () {
                            context
                                .read(projectComplexityDataProvider)
                                .setData(1);
                          },
                        ),
                        ComplexityInputButton(
                          complexityText: "High",
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: complexityValue.data == 2
                              ? kActiveHigh
                              : kInactiveColor,
                          setComplexity: () {
                            context
                                .read(projectComplexityDataProvider)
                                .setData(2);
                          },
                        ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            if (context.read(externalInputProvider).data == 0 ||
                context.read(externalOutputProvider).data == 0 ||
                context.read(externalInquiryProvider).data == 0 ||
                context.read(externalInterfaceFileProvider).data == 0 ||
                context.read(internalLogicalFileProvider).data == 0)
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
                        "Values cannot be empty",
                        style: kTextSpanActiveStyle,
                      ),
                    ),
                  ),
                ),
              );
            else
              Navigator.pushNamed(context, FPComplexityFactors.route);
          },
          child: Text(
            "Next",
            style: kButtonStyle,
          ),
        ),
      ),
    );
  }
}
