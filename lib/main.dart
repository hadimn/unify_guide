import 'package:calculator/materials/classes/themeProvider.dart';
import 'package:calculator/materials/pages/calculator/calculator.dart';
import 'package:calculator/materials/pages/Home/homePage.dart';
import 'package:calculator/materials/pages/todo/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? displayMode = "dark";
  var homeGlobalKey = GlobalKey<ScaffoldState>();
  var calculatorGlobalKey = GlobalKey<ScaffoldState>();
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/calculator": (context) => const CalculatorPage(title: "My Calculator",),
        "/to-do":(context) => const TodoPage(),
        // calendar
        // clock ( Alarm, World Clock, Stopwatch, Timer )
        // Notes
        // QrScanner

        /* optional apps */
        // weather
        // Radio
        // Voice Recorder
        // Music Player
        // 
      },
    );
  }
}
