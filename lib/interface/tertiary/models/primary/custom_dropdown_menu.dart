import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_estimation/data/globals.dart';

class CustomDropDownMenu extends StatelessWidget {
  final String dropdownValue;
  final Function getLanguage;
  final List<DropdownMenuItem<String>> dropdownItems;

  CustomDropDownMenu(
      {required this.dropdownValue,
      required this.dropdownItems,
      required this.getLanguage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 10, left: 15, right: 15),
      margin: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius15,
      ),
      alignment: Alignment.center,
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: kActiveColor, fontSize: 20),
        underline: Container(
          height: 2,
          color: kActiveColor,
        ),
        onChanged: (string) => getLanguage(string),
        items: dropdownItems,
      ),
    );
  }
}
