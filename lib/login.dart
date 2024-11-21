// Mengimpor paket-paket yang diperlukan
import 'package:flutter/material.dart';  // Paket untuk komponen Material Design
import 'package:google_fonts/google_fonts.dart';  // Paket untuk menggunakan font dari Google Fonts
import 'colors.dart';  // Mengimpor file colors.dart untuk warna khusus aplikasi

// Halaman login menggunakan StatefulWidget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});  // Konstruktor untuk LoginPage

  // Membuat state untuk LoginPage
  @override
  _LoginPageState createState() => _LoginPageState();
}

// State dari LoginPage
class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    // Controller untuk TextField username dan password
    final usernameController = TextEditingController();
    final passwordController = TextEditingController();

    // Scaffold adalah struktur dasar dari halaman
    return Scaffold(
      body: Center(  // Menempatkan semua widget di tengah layar
        child: Column(  // Menyusun widget secara vertikal
          mainAxisAlignment: MainAxisAlignment.start,  // Menyusun widget dari atas ke bawah
          children: <Widget>[
            const SizedBox(height: 60.0),  // Memberikan jarak dari atas
            // Kolom untuk menampilkan logo aplikasi
            Column(
              children: <Widget>[
                Image.asset(  // Menampilkan gambar dengan menggunakan asset
                  'pedulipanti.png',
                  width: 100.0,  // Lebar gambar
                  height: 100.0, // Tinggi gambar
                  fit: BoxFit.contain,  // Menjaga rasio aspek gambar
                ),
                const SizedBox(height: 16.0),  // Memberikan jarak setelah gambar
              ],
            ),
            const SizedBox(height: 30.0),  // Jarak setelah logo
            // Menampilkan teks "Welcome to Peduli Panti"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),  // Padding kiri dan kanan
              child: Text(
                'Welcome to Peduli Panti',  // Teks yang ditampilkan
                style: GoogleFonts.poppins(  // Menggunakan font Poppins dari Google Fonts
                  fontSize: 22,  // Ukuran font
                  fontWeight: FontWeight.bold,  // Menebalkan font
                  color: const Color.fromARGB(255, 30, 31, 78),  // Warna teks
                ),
                textAlign: TextAlign.center,  // Menyelaraskan teks ke tengah
              ),
            ),
            const SizedBox(height: 10.0),  // Jarak antar teks
            // Menampilkan teks deskripsi "Please log in first..."
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                'Please log in first before making a donation and contributing to our cause',
                style: GoogleFonts.poppins(  // Font Poppins
                  fontSize: 18,  // Ukuran font
                  color: const Color.fromARGB(255, 30, 31, 78),  // Warna teks
                ),
                textAlign: TextAlign.center,  // Teks rata tengah
              ),
            ),
            const SizedBox(height: 70.0),  // Jarak setelah deskripsi
            // Menampilkan TextField untuk memasukkan username
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: usernameController,  // Menggunakan controller untuk mengelola input
                decoration: InputDecoration(
                  labelText: 'Username',  // Label untuk TextField
                  hintText: 'Enter your username',  // Petunjuk untuk TextField
                  prefixIcon: const Icon(Icons.person, color: Color.fromARGB(255, 30, 31, 78)),  // Ikon untuk username
                  labelStyle: GoogleFonts.poppins(  // Menggunakan font Poppins untuk label
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 30, 31, 78),
                  ),
                  border: OutlineInputBorder(  // Border dari TextField
                    borderRadius: BorderRadius.circular(12.0),  // Radius untuk sudut border
                    borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192)),  // Warna border
                  ),
                  focusedBorder: OutlineInputBorder(  // Border saat TextField mendapatkan fokus
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192), width: 2.0),  // Border lebih tebal
                  ),
                ),
                style: GoogleFonts.poppins(  // Font untuk teks yang dimasukkan
                  fontSize: 14.0,
                  color: Colors.black87,  // Warna teks
                ),
              ),
            ),
            const SizedBox(height: 20.0),  // Jarak antar TextField
            // Menampilkan TextField untuk memasukkan password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: passwordController,  // Controller untuk password
                decoration: InputDecoration(
                  labelText: 'Password',  // Label untuk TextField password
                  hintText: 'Enter your password',  // Petunjuk untuk TextField password
                  prefixIcon: const Icon(Icons.lock, color: Color.fromARGB(255, 30, 31, 78)),  // Ikon untuk password
                  labelStyle: GoogleFonts.poppins(  // Menggunakan font Poppins untuk label
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 30, 31, 78),
                  ),
                  border: OutlineInputBorder(  // Border dari TextField
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192)),  // Warna border
                  ),
                  focusedBorder: OutlineInputBorder(  // Border saat TextField mendapatkan fokus
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Color.fromARGB(255, 68, 108, 192), width: 2.0),  // Border lebih tebal
                  ),
                ),
                style: GoogleFonts.poppins(  // Font untuk teks yang dimasukkan
                  fontSize: 14.0,
                  color: Colors.black87,
                ),
                obscureText: true,  // Menyembunyikan teks yang dimasukkan (untuk password)
              ),
            ),
            const SizedBox(height: 20.0),  // Jarak antar TextField
            // Menampilkan tombol untuk membatalkan atau melanjutkan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: OverflowBar(  // Menggunakan OverflowBar untuk menyusun tombol
                alignment: MainAxisAlignment.end,  // Menyusun tombol ke kanan
                children: <Widget>[
                  // Tombol Cancel
                  TextButton(
                    onPressed: () {
                      usernameController.clear();  // Menghapus input username
                      passwordController.clear();  // Menghapus input password
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: kShrineBrown900,  // Warna teks tombol
                      shape: const BeveledRectangleBorder(  // Bentuk tombol dengan sudut melengkung
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                    child: Text('CANCEL'),  // Teks pada tombol
                  ),
                  // Tombol Next
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/');  // Pindah ke route "/" setelah tombol ditekan
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: kShrineBlue500,  // Warna teks tombol
                      backgroundColor: kShrineBlue100,  // Warna latar belakang tombol
                      elevation: 8.0,  // Tingkat elevasi tombol
                      shape: const BeveledRectangleBorder(  // Bentuk tombol dengan sudut melengkung
                        borderRadius: BorderRadius.all(Radius.circular(7.0)),
                      ),
                    ),
                    child: Text('NEXT'),  // Teks pada tombol
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
