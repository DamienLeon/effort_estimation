import 'package:flutter/material.dart';
import 'package:software_estimation/data/globals.dart';

class ComplexitySliderTile extends StatelessWidget {
  final double sliderValue;
  final String sliderLabel;
  final String parameterText;
  final Function setSliderValue;

  const ComplexitySliderTile(
      {required this.sliderValue,
      required this.sliderLabel,
      required this.parameterText,
      required this.setSliderValue});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            parameterText,
            style: kLabelStyle,
          ),
          const SizedBox(
            height: 5,
          ),
          Slider(
            value: sliderValue,
            min: 0,
            max: 5,
            divisions: 5,
            label: sliderLabel,
            onChanged: (double) => setSliderValue(double),
            inactiveColor: kInactiveColor,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
