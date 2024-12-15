import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spanandshade/main_UI.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyBPpc1RCbz3XdVFKBrf9M-4KFipD_JpZ3o",
        authDomain: "website-12c7e.firebaseapp.com",
        projectId: "website-12c7e",
        storageBucket: "website-12c7e.firebasestorage.app",
        messagingSenderId: "440085900092",
        appId: "1:440085900092:web:ded56411d65495b7134c39",
        measurementId: "G-5TMZYRL8M2"),
  );
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
