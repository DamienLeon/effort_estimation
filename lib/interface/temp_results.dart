import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:software_estimation/application/provider_data_tertiary/tertiary_data_providers.dart';
import 'package:software_estimation/data/globals.dart';

class ResultsPage extends StatelessWidget {
  static String route = "results_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer(builder: (context, watch, child) {
            final effort = watch(effortProvider);
            final time = watch(timeProvider);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Estimated Effort",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${effort.effortData[1].round().toString()} person months",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Effort Estimation Range:",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${effort.effortData[0].round().toString()} to ${effort.effortData[2].round().toString()} person months",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Estimated Time",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${time.timeData[1].round().toString()} months",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Time Estimation Range:",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${time.timeData[0].round().toString()} to ${time.timeData[2].round().toString()} person months",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Persons Required",
                        style: TextStyle(color: Colors.black, fontSize: 27),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${(effort.effortData[1] / time.timeData[1]).round()}",
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green,
        child: TextButton(
          child: Text(
            "Finish",
            style: kButtonStyle,
          ),
          onPressed: () {
            Navigator.popUntil(context, (_) => _.isFirst);
          },
        ),
      ),
    );
  }
}
