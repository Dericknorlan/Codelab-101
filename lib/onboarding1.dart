import 'package:codelab101/colors.dart';
import 'package:codelab101/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'onboarding2.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'pedulipanti.png',
                  width: 100.0, // Set width to scale the image
                  height: 100.0, // Set height to scale the image
                  fit: BoxFit.contain, // Ensure the aspect ratio is maintained
                ),
              ],
            ),
            // Lottie Animation
            Expanded(
              child: Lottie.asset(
                'animations/box.json',
                fit: BoxFit.contain,
              ),
            ),
            // Title and Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0), // Adjust padding as needed
              child: Text(
                'Welcome to Peduli Panti',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 25.0), // Adjust padding as needed
              child: Text(
                'Donate essential items to help those in need and bring comfort to families and their little ones.',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24.0),
            // Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboarding2Screen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 100, 149, 237),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      minimumSize: const Size.fromHeight(50),
                    ),
                    child: Text(
                      'Next',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      side: const BorderSide(
                        color: Color.fromARGB(255, 255, 174, 251),
                        width: 2.0,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: kShrineBlue500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
