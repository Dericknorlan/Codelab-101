import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: Add text editing controllers (101)
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 60.0),
            Column(
              children: <Widget>[
                Image.asset(
                  'pedulipanti.png',
                  width: 100.0,  // Set width to scale the image
                  height: 100.0, // Set height to scale the image
                  fit: BoxFit.contain,  // Ensure the aspect ratio is maintained
                  ),
                const SizedBox(height: 16.0),
              ],
            ),
            const SizedBox(height: 30.0),
            // TODO: Add TextField widgets (101)
            // [Name]
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Adjust padding as needed
              child: Text(
                'Welcome to Peduli Panti',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 30, 31, 78),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Adjust padding as needed
              child: Text(
                'Please log in first before making a donation and contributing to our cause',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color:const Color.fromARGB(255, 30, 31, 78),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 70.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Adjust padding as needed
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 30, 31, 78)),
                  labelStyle: GoogleFonts.poppins( // Apply Poppins font to label
                    fontSize: 14.0, // Font size for the label text
                    color: const Color.fromARGB(255, 30, 31, 78), // Label text color
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0), // Membuat border melengkung
                    borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 68, 108, 192), // Warna border saat fokus
                      width: 2.0, // Ketebalan border saat fokus
                    ),
                  ),
                ),
                style: GoogleFonts.poppins( // Apply Poppins font here
                  fontSize: 14.0, // Adjust font size as needed
                  color: Colors.black87, // Text color
                ),
              ),
            ),
            // spacer
            const SizedBox(height: 20.0),
            // [Password]
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0), // Adjust padding as needed
              child:TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 30, 31, 78)),
                labelStyle: GoogleFonts.poppins( // Apply Poppins font to label
                  fontSize: 14.0, // Font size for the label text
                  color: const Color.fromARGB(255, 30, 31, 78), // Label text color
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192), width: 2.0),
                ),
              ),
              style: GoogleFonts.poppins( // Apply Poppins font here
                fontSize: 14.0, // Adjust font size as needed
                color: Colors.black87, // Text color
              ),
              obscureText: true,
            ),
            ),
            const SizedBox(height: 20.0),
            // TODO: Add button bar (101)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: OverflowBar(
              alignment: MainAxisAlignment.end,
              // TODO: Add a beveled rectangular border to CANCEL (103)
              children: <Widget>[
                // TODO: Add buttons (101)
                TextButton(
                  onPressed: () {
                    usernameController.clear();
                    passwordController.clear();
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: kShrineBrown900,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
                  child: Text('CANCEL'),
                ),
                // TODO: Add an elevation to NEXT (103)
                // TODO: Add a beveled rectangular border to NEXT (103)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/'); // Pindah ke route "/"
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: kShrineBlue500,
                      backgroundColor: kShrineBlue100,
                      elevation: 8.0,
                      shape: const BeveledRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                  child: Text('NEXT'),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
