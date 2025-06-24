import 'package:calculator/materials/appBar.dart';
import 'package:calculator/materials/pages/calculator/body.dart';
import 'package:calculator/materials/classes/themeProvider.dart';
import 'package:calculator/materials/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorPage extends StatelessWidget {

  const CalculatorPage({super.key, required this.title,});

  final String title;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBarWidget(
        title: "Calculator",
        displayMode: themeProvider.displayMode,
        toggleDisplayMode: themeProvider.toggleDisplayMode,
      ),
      drawer: const DrawerWidget(),
      body: Bodypage(
        displayMode: themeProvider.displayMode,
      ),
    );
  }
}
