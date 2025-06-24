import 'package:calculator/materials/pages/Home/body.dart';
import 'package:calculator/materials/classes/themeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/materials/appBar.dart';
import 'package:calculator/materials/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBarWidget(
        title: "Unify Tools",
        displayMode: themeProvider.displayMode,
        toggleDisplayMode: themeProvider.toggleDisplayMode,
      ),
      drawer: const DrawerWidget(),
      body: HomeBody(displayMode: themeProvider.displayMode),
    );
  }
}
