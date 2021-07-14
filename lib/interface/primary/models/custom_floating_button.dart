import 'package:flutter/material.dart';

import '../../../data/globals.dart';

class CustomFloatingButton extends StatelessWidget {
  final String primaryTitle;
  final String dialogTitle;
  final Function textFieldOnPressed;
  final Function onPressed;

  CustomFloatingButton(
      {required this.primaryTitle,
      required this.dialogTitle,
      required this.textFieldOnPressed,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      label: Text(
        primaryTitle,
        style: kButtonStyle,
      ),
      icon: Icon(Icons.add_circle_outline),
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(),
                  TextField(
                    style: kTextFieldStyle,
                    textAlign: TextAlign.center,
                    autofocus: true,
                    onChanged: (_) => textFieldOnPressed(_),
                  ),
                  SizedBox(),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color(0xff004d40),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: TextButton(
                      child: Text(
                        dialogTitle,
                        style: kButtonStyle,
                      ),
                      onPressed: () => onPressed(),
                    ),
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
