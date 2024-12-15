import 'package:flutter/material.dart';

class Project extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/img/YUGESH DONE-images-4.jpg',
    //'assets/images/image2.png',
    //'assets/images/image3.png',
    // Add more image paths as needed
  ];

  Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projects'),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(imagePaths[index]),
          );
        },
      ),
    );
  }
}
