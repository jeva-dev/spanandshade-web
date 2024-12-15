// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:spanandshade/aboutus.dart';
import 'package:spanandshade/contact.dart';
import 'package:spanandshade/design_arch.dart';
import 'package:spanandshade/header.dart';
import 'package:spanandshade/home.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            Home(),
            DesignArch(),
            AboutUs(),
            Contact(),
          ],
        ),
      ),
    );
  }
}
