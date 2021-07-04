import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_secondary/secondary_providers.dart';
import 'package:software_estimation/application/provider_data_tertiary/tertiary_data_providers.dart';
import 'package:software_estimation/data/class_data/tertiary/function_points.dart';
import 'package:software_estimation/data/globals.dart';
import 'package:software_estimation/data/resources/fp_input/primary.dart';
import 'package:software_estimation/interface/secondary/models/complexity_slider_tile.dart';
import 'package:software_estimation/interface/tertiary/screens/effort_primary.dart';

class FPComplexityFactors extends StatelessWidget {
  static const String route = 'fp_complexity_factors_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rate the following factors accordingly:",
                style: kTitleStyle,
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(5),
                  itemCount: kAspects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return new Consumer(builder: (context, watch, child) {
                      final complexityFactor =
                          watch(complexityFactorsDataProvider);
                      return ComplexitySliderTile(
                        sliderValue:
                            complexityFactor.complexityValuesList[index],
                        parameterText: kAspects[index],
                        sliderLabel: kComplexityFactors[complexityFactor
                            .complexityValuesList[index]
                            .round()],
                        setSliderValue: (double value) {
                          context
                              .read(complexityFactorsDataProvider)
                              .setData(value, index);
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: TextButton(
          onPressed: () {
            print(context
                .read(complexityFactorsDataProvider)
                .complexityValuesList);
            final double calculate = FunctionPointCalculation(
                    context.read(externalInputProvider).data,
                    context.read(externalOutputProvider).data,
                    context.read(externalInquiryProvider).data,
                    context.read(externalInterfaceFileProvider).data,
                    context.read(internalLogicalFileProvider).data,
                    context.read(projectComplexityDataProvider).data,
                    context
                        .read(complexityFactorsDataProvider)
                        .complexityValuesList)
                .calculate();
            context.read(functionPointsProvider).setData(calculate);
            Navigator.pushNamed(context, EffortPrimaryScreen.route);
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
