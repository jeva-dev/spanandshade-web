import 'package:flutter/material.dart';
import 'package:spanandshade/main_UI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
        ),
        home: const MainUI(),
        darkTheme: ThemeData.dark().copyWith(
          primaryColor: Colors.blueAccent, // Primary color for the app
          // Background color
          scaffoldBackgroundColor:
              Colors.grey[850], // Background for the scaffold
        ));
  }
}
