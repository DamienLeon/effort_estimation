import 'package:flutter/material.dart';

const Color kActiveColor = Colors.green;
const Color kInactiveColor = Colors.grey;

const Color kActiveLow = Colors.red;
const Color kActiveAverage = Colors.amber;
const Color kActiveHigh = Colors.green;

const TextStyle kButtonStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

const TextStyle kTitleStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: Color(0xff2B2D2F),
);

const TextStyle kLabelStyle = TextStyle(
  fontSize: 18,
  color: Color(0xff2B2D2F),
);

const TextStyle kTextFieldStyle = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
  color: kActiveColor,
);

const BorderRadius kBorderRadius15 = BorderRadius.all(Radius.circular(15));

const TextStyle kCardTextStyle = TextStyle(
  fontSize: 16,
  color: Color(0xff2B2D2F),
);

Column kDivider1 = Column(
  children: [
    const SizedBox(height: 10),
    Divider(
      thickness: 3,
    ),
    const SizedBox(height: 10),
  ],
);
