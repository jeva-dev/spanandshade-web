import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DesignArch extends StatefulWidget {
  const DesignArch({super.key});

  @override
  State<DesignArch> createState() => _DesignArchState();
}

class _DesignArchState extends State<DesignArch> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start of the column
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Add padding to the Column
              child: Text(
                "Work towards your Satisfaction:",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20, // Font size for consistency
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Padding for the text container
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width *
                      0.9, // 90% of screen width
                ),
                child: Text(
                  "We are committed to delivering exceptional results from initial design to final implementation. Our process begins with a detailed consultation to understand your vision, followed by iterative design phases to ensure you are completely satisfied with the outcome. We provide transparent and competitive quotations for all components, ensuring no hidden costs. Our commitment extends beyond the completion of your project; we offer lifetime support to address any future needs or modifications. With a focus on precision, we guarantee that every design is executed with the utmost accuracy, delivering a flawless finish that meets your exact specifications.",
                  style: GoogleFonts.lato(
                    fontSize: 16, // Consistent font size
                    height: 1.5, // Adjust line height for better readability
                  ),
                  overflow:
                      TextOverflow.visible, // Ensure text is visible and wraps
                  softWrap: true, // Allow text to wrap
                ),
              ),
            ),
          ],
        ));
  }
}
