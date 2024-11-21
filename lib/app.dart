import 'package:codelab101/onboarding1.dart'; // Mengimpor halaman OnboardingScreen untuk halaman login
import 'package:flutter/material.dart'; // Mengimpor material design untuk komponen UI

import 'backdrop.dart'; // Mengimpor widget Backdrop untuk menampilkan lapisan depan dan belakang
import 'category_menu_page.dart'; // Mengimpor halaman CategoryMenuPage untuk menampilkan menu kategori
import 'colors.dart'; // Mengimpor file warna untuk tema aplikasi
import 'detail_page.dart'; // Mengimpor halaman DetailPage untuk menampilkan detail produk
import 'home.dart'; // Mengimpor halaman HomePage untuk menampilkan produk
import 'model/products.dart'; // Mengimpor model produk untuk digunakan dalam aplikasi
import 'supplemental/cut_corners_border.dart'; // Mengimpor border kustom untuk elemen input

// Class utama aplikasi Peduli Panti
class PeduliPanti extends StatefulWidget {
  const PeduliPanti({super.key});

  @override
  _PeduliPantiState createState() => _PeduliPantiState();
}

class _PeduliPantiState extends State<PeduliPanti> {
  Category _currentCategory = Category.all; // Menyimpan kategori produk yang sedang dipilih

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peduli Panti', // Nama aplikasi
      initialRoute: '/login', // Rute awal aplikasi adalah halaman login
      debugShowCheckedModeBanner: false, // Menyembunyikan banner debug
      routes: {
        '/login': (BuildContext context) => const OnboardingScreen(), // Rute untuk halaman login
        '/': (BuildContext context) => Backdrop(
          currentCategory: _currentCategory, // Menyediakan kategori yang sedang dipilih
          frontLayer: HomePage(category: _currentCategory), // Layer depan menampilkan halaman produk
          backLayer: CategoryMenuPage(
            currentCategory: _currentCategory, // Menyediakan kategori untuk halaman menu
            onCategoryTap: _onCategoryTap, // Menangani saat kategori dipilih
          ),
          frontTitle: const Text('Peduli Panti'), // Judul untuk layer depan
          backTitle: const Text('MENU'), // Judul untuk layer belakang
        ),
        '/details': (context) => const DetailPage(
          productName: 'Default Name', // Nama produk default
          productDescription: 'Default Description', // Deskripsi produk default
          price: 0, // Harga produk default
          imageUrl: 'default.png', // URL gambar default
        ),
      },
      theme: _kShrineTheme, // Tema aplikasi yang telah didefinisikan
    );
  }

  /// Fungsi yang dipanggil saat kategori dipilih
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category; // Mengubah kategori yang dipilih
    });
  }
}

// Membuat tema aplikasi menggunakan Shrine Theme
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light(useMaterial3: true); // Menggunakan tema material 3
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100, // Warna primer untuk aplikasi
      onPrimary: kShrineBlue400, // Warna untuk teks di atas warna primer
      secondary: kShrineBlue500, // Warna sekunder
      error: kShrineErrorRed, // Warna untuk error
    ),
    // Menambahkan tema teks untuk aplikasi
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100, // Warna pemilihan teks
    ),
    appBarTheme: const AppBarTheme(
      foregroundColor: kShrineBrown900, // Warna teks di app bar
      backgroundColor: kShrineBlue100, // Warna latar belakang app bar
    ),
    // Menambahkan dekorasi untuk elemen input seperti TextField
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(), // Border dengan sudut yang dipotong
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0, // Lebar border saat input terfokus
          color: kShrineBrown900, // Warna border saat terfokus
        ),
      ),
      floatingLabelStyle: TextStyle(
        color: kShrineBlue500, // Warna label saat mengambang
      ),
    ),
  );
}

// Membuat tema teks untuk aplikasi
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headlineSmall: base.headlineSmall!.copyWith(
          fontWeight: FontWeight.w500, // Mengatur bobot font untuk headline
        ),
        titleLarge: base.titleLarge!.copyWith(
          fontSize: 18.0, // Ukuran font untuk judul besar
        ),
        bodySmall: base.bodySmall!.copyWith(
          fontWeight: FontWeight.w400, // Bobot font untuk teks kecil
          fontSize: 14.0, // Ukuran font untuk teks kecil
        ),
        bodyLarge: base.bodyLarge!.copyWith(
          fontWeight: FontWeight.w500, // Bobot font untuk teks besar
          fontSize: 16.0, // Ukuran font untuk teks besar
        ),
      )
      .apply(
        fontFamily: 'Poppins', // Menggunakan font Poppins
        displayColor: const Color.fromARGB(255, 0, 0, 0), // Warna teks untuk judul
        bodyColor: const Color.fromARGB(255, 0, 0, 0), // Warna teks untuk body
      );
}
