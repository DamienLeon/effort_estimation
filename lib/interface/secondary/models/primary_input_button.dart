import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_estimation/data/globals.dart';

class PrimaryInputButton extends StatelessWidget {
  final String buttonTitle;
  final Function setData;

  const PrimaryInputButton({
    required this.buttonTitle,
    required this.setData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius15,
      ),
      child: Column(
        children: [
          Text(
            buttonTitle,
            style: kLabelStyle,
          ),
          TextField(
            keyboardType: TextInputType.numberWithOptions(
              decimal: false,
              signed: false,
            ),
            textAlign: TextAlign.center,
            style: kTextFieldStyle,
            onChanged: (_) => setData(_),
          ),
        ],
      ),
    );
  }
}
