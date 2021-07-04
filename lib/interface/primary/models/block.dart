import 'package:flutter/material.dart';
import 'package:software_estimation/data/globals.dart';

class Block extends StatelessWidget {
  final String blockName;
  final Function onPressed;
  final Function deleteBlock;
  final String effort;
  final String effortLow;
  final String effortHigh;
  final String time;
  final String timeLow;
  final String timeHigh;
  final String personsReq;

  const Block({
    required this.blockName,
    required this.onPressed,
    required this.deleteBlock,
    required this.effort,
    required this.effortLow,
    required this.effortHigh,
    required this.time,
    required this.timeLow,
    required this.timeHigh,
    required this.personsReq,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: TextButton(
                    child: Text(
                      blockName,
                      style: kButtonStyle,
                    ),
                    onPressed: () => onPressed(),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => deleteBlock(),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Effort:", style: kCardTextStyle),
                    Text("$effort person months", style: kCardTextStyle),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Range:", style: kCardTextStyle),
                    Text("$effortLow to $effortHigh person months",
                        style: kCardTextStyle),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Time:",
                      style: kCardTextStyle,
                    ),
                    Text("$time months", style: kCardTextStyle),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Range:", style: kCardTextStyle),
                    Text("$timeLow to $timeHigh months", style: kCardTextStyle),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Persons Required:", style: kCardTextStyle),
                    Text("$personsReq persons", style: kCardTextStyle),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
