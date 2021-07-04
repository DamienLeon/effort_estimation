import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_estimation/data/globals.dart';

class ProjectTypeRadio extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String projectTypeLabel;
  final Function onRadioSelected;

  ProjectTypeRadio(
      {required this.color,
      required this.icon,
      required this.projectTypeLabel,
      required this.onRadioSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius15,
      ),
      child: TextButton(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                SizedBox(width: 10),
                Text(
                  projectTypeLabel,
                  style: TextStyle(color: color, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Enter description here",
              style: TextStyle(color: color, fontSize: 18),
            ),
          ],
        ),
        onPressed: () => onRadioSelected(),
      ),
    );
  }
}
