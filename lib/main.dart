import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:software_estimation/screens/_temp/result.dart';
import 'package:software_estimation/screens/_temp/test.dart';
import 'package:software_estimation/screens/primary_screens/project_blocks_screen.dart';
import 'package:software_estimation/screens/primary_screens/home_projects.dart';
import 'package:software_estimation/screens/secondary_screens/fp_input_primary.dart';
import 'package:software_estimation/screens/secondary_screens/fp_input_secondary.dart';
import 'package:software_estimation/screens/tertiary_screens/effort_primary.dart';
import 'package:software_estimation/screens/tertiary_screens/hardware_attributes.dart';
import 'package:software_estimation/screens/tertiary_screens/personal_attributes.dart';
import 'package:software_estimation/screens/tertiary_screens/product_attributes.dart';
import 'package:software_estimation/screens/tertiary_screens/project_attributes.dart';

void main() {
  //final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  //Hive.init(appDocumentDir.path);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Software Effort Estimation',
      theme: ThemeData(
          primarySwatch: Colors.green,
          scaffoldBackgroundColor: Colors.grey.shade300),
      routes: <String, WidgetBuilder>{
        ProjectBlocksScreen.route: (context) => ProjectBlocksScreen(),
        FPInputScreen.route: (context) => FPInputScreen(),
        FPComplexityFactors.route: (context) => FPComplexityFactors(),
        EffortPrimaryScreen.route: (context) => EffortPrimaryScreen(),
        ProductAttributesScreen.route: (context) => ProductAttributesScreen(),
        HardwareAttributesScreen.route: (context) => HardwareAttributesScreen(),
        PersonalAttributesScreen.route: (context) => PersonalAttributesScreen(),
        ProjectAttributesScreen.route: (context) => ProjectAttributesScreen(),
        ResultsPage.route: (context) => ResultsPage(),
      },
      home: ProjectsScreen(),
    );
  }
}
