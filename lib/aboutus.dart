import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
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
                "About Us:",
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
                  "Our firm handles every project with an attention to detail that would enhance the user experience of the spaces and built environment. Since 2023 we have collaborated across disciplines and industries to bring buildings and infrastructure projects to life earning several awards and recognitions. Grabbing multiple architecture projects through design competitions in and around India. The firm is credited with a variety of work portfolio ranging from residences, hospitality, institutional, healthcare, commercial, industrial and religious projects in pan India level.",
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
