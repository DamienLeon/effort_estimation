import 'package:flutter/material.dart';
import 'package:software_estimation/globals.dart';

class ComplexityInputButton extends StatelessWidget {
  final String complexityText;
  final Function setComplexity;
  final Color color;
  final BorderRadius borderRadius;

  const ComplexityInputButton({
    required this.complexityText,
    required this.setComplexity,
    required this.color,
    required this.borderRadius,
  });

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: TextButton(
          child: Text(
            complexityText,
            style: kButtonStyle,
          ),
          onPressed: () => setComplexity(),
        ),
      ),
    );
  }
}
