import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'interface/temp_results.dart';
import 'interface/primary/screens/home_projects.dart';
import 'interface/primary/screens/project_blocks_screen.dart';
import 'interface/secondary/screens/fp_input_primary.dart';
import 'interface/secondary/screens/fp_input_secondary.dart';
import 'interface/tertiary/screens/effort_primary.dart';
import 'interface/tertiary/screens/hardware_attributes.dart';
import 'interface/tertiary/screens/personal_attributes.dart';
import 'interface/tertiary/screens/product_attributes.dart';
import 'interface/tertiary/screens/project_attributes.dart';

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
          appBarTheme: AppBarTheme(
            color: Color(0xff004d40),
          ),
          scaffoldBackgroundColor: Colors.grey.shade300,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff004d40),
          )),
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
