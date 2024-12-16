import 'package:flutter/material.dart';
import 'package:spanandshade/form.dart';
import 'package:spanandshade/projects.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final bool isLargeScreen = screenWidth > 600; // Adjust threshold as needed

    // Determine font size for text based on screen width
    double fontSize =
        screenWidth * 0.08; // Default font size based on screen width
    if (isLargeScreen) {
      fontSize =
          fontSize.clamp(40.0, 50.0); // Limit the font size between 40 and 50
    }

    // Determine font size for button text, with a max size for larger screens
    double buttonFontSize = screenWidth * 0.04; // Default button font size
    if (isLargeScreen) {
      buttonFontSize = buttonFontSize.clamp(
          18.0, 24.0); // Limit button text size between 18 and 24
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Space between the elements
        children: [
          // Image on the start, resizing based on screen width and height
          Image.asset(
            "assets/s&s.png",
            height: screenHeight * 0.15, // 15% of the screen height
            width: screenWidth * 0.3, // 30% of the screen width
            fit: BoxFit.contain, // Ensure the image scales properly
          ),

          // Text in the center, conditionally displayed
          //if (isLargeScreen)
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Span & Shade Architects",
                style: TextStyle(
                  fontSize: fontSize, // Dynamically set font size
                  fontFamily: 'Copperplate_Gothic_Bold',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => Project()),
          //     );
          //   },
          //   child: Text(
          //     "Projects",
          //     style: TextStyle(
          //       fontSize: buttonFontSize, // Dynamically adjust button font size
          //     ),
          //   ),
          // ),

          // // ElevatedButton at the end, resizing based on screen width
          // TextButton(
          //   onPressed: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const BookDemoForm()),
          //     );
          //   },
          //   child: Text(
          //     "Book a Demo",
          //     style: TextStyle(
          //       fontSize: buttonFontSize, // Dynamically adjust button font size
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
