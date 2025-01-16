// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';

class MainUI extends StatefulWidget {
  const MainUI({super.key});

  @override
  State<MainUI> createState() => _MainUIState();
}

class _MainUIState extends State<MainUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('s&s.png'),
        title: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              // Mobile view
              return const Text(
                'Span and Shade Architects',
                style: TextStyle(fontSize: 20),
              );
            } else if (constraints.maxWidth < 1200) {
              // Tablet view
              return const Text(
                'Span and Shade Architects',
                style: TextStyle(fontSize: 24),
              );
            } else {
              // Desktop view
              return const Text(
                'Span and Shade Interior Design Studio',
                style: TextStyle(fontSize: 32),
              );
            }
          },
        ),
        backgroundColor: Colors.black,
        centerTitle: false,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 40),
                    color: Colors.black,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Welcome to Architectural Excellence',
                              textStyle: TextStyle(
                                fontSize: isMobile ? 24 : 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.tealAccent,
                              ),
                              speed: const Duration(milliseconds: 100),
                            ),
                          ],
                          totalRepeatCount: 1,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Crafting innovative and sustainable designs for your spaces.',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: isMobile ? 16 : 20,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: _launchURL,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.tealAccent,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Enquire Now',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: isMobile ? 16 : 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SizedBox(height: 16),
                  // Services Section
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Our Services',
                          style: TextStyle(
                            fontSize: isMobile ? 24 : 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.tealAccent,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight:
                                isMobile ? 800 : 1000, // Limit the height
                          ),
                          child: GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: isMobile
                                  ? 1
                                  : (constraints.maxWidth < 1200 ? 2 : 3),
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 3 / 2,
                            ),
                            itemCount: 7, // Total number of service cards
                            itemBuilder: (context, index) {
                              final services = [
                                {
                                  'title': 'Schematic Plan',
                                  'description':
                                      'Transforming ideas into feasible architectural plan.',
                                  'image': 'assets/schematic.jpeg',
                                },
                                {
                                  'title': 'Elevation',
                                  'description':
                                      'Creating two-dimensional drawing that shows one side of a building or space from a straight-on perspective.',
                                  'image': 'assets/elevation.jpeg',
                                },
                                {
                                  'title': '3D Interior Design',
                                  'description':
                                      'Creating a virtual model of a space interior using software.',
                                  'image': 'assets/3d.jpeg',
                                },
                                {
                                  'title': 'Electrical Layout',
                                  'description':
                                      'Creating technical drawing that shows the location of electrical components in a building.',
                                  'image': 'assets/electrical.jpeg',
                                },
                                {
                                  'title': 'Lighting Layout',
                                  'description':
                                      'Creating a visual representation of how light will be distributed in a space, based on the placement of specific lighting fixtures or natural light.',
                                  'image': 'assets/lighting.jpeg',
                                },
                                {
                                  'title': 'Plumbing Layout',
                                  'description':
                                      'Creating a detailed plan that shows the arrangement of pipes, fixtures, and appliances in a building.',
                                  'image': 'assets/plumbing.jpeg',
                                },
                                {
                                  'title': '2D Detailed Plan',
                                  'description':
                                      'Creating a top-down view, similar to a bird-eye view, showing the arrangement of rooms, walls, doors, windows, and other architectural features.',
                                  'image': 'assets/2d.png',
                                },
                              ];
                              return serviceCard(
                                services[index]['title']!,
                                services[index]['description']!,
                                isMobile,
                                services[index]['image']!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  Container(
                    color: Colors.grey[900],
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        bool isMobile = constraints.maxWidth < 600;
                        return isMobile
                            ? const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Contact Us',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.tealAccent,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'info@spanandshade.com',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '+919488536969',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Column(
                                    children: [
                                      Text(
                                        'Span and Shade',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.tealAccent,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '© 2025 All Rights Reserved',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Contact Us',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.tealAccent,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        'info@spanandshade.com',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '+919488536969',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Span and Shade',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.tealAccent,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '© 2025 All Rights Reserved',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _launchURL() async {
    final Uri url = Uri.parse('https://forms.gle/18zHPNewNZ44epPn6');
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget serviceCard(
      String title, String description, bool isMobile, String imagePath) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: isMobile ? 1000 : 1000,
      width: isMobile ? double.infinity : 300,
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Asset Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: isMobile ? 50 : 120, // Adjust image height for mobile
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          // Service Title
          Text(
            title,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              fontWeight: FontWeight.bold,
              color: Colors.tealAccent,
            ),
          ),
          const SizedBox(height: 8),
          // Service Description
          SizedBox(
            height: 40, // Restrict height to prevent overflow
            child: Text(
              description,
              style: TextStyle(
                fontSize: isMobile ? 14 : 16,
                color: Colors.white70,
              ),
              maxLines: 2, // Adjust for mobile and desktop
              overflow: TextOverflow.ellipsis, // Prevent overflow
            ),
          ),
        ],
      ),
    );
  }
}
