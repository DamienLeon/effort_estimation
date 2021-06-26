import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AttributeRadioTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String selectedFactor;
  final String attributeFactorLabel;
  final Function onRadioSelected;

  AttributeRadioTile(
      {required this.color,
      required this.icon,
      required this.selectedFactor,
      required this.attributeFactorLabel,
      required this.onRadioSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextButton(
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            SizedBox(width: 10),
            Text(
              attributeFactorLabel,
              style: TextStyle(color: color, fontSize: 16),
            ),
          ],
        ),
        onPressed: () => onRadioSelected(),
      ),
    );
  }
}
