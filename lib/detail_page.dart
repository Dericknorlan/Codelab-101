import 'package:codelab101/colors.dart'; // Mengimpor file warna untuk menggunakan konstanta warna yang sudah ditentukan
import 'package:flutter/material.dart'; // Mengimpor material design untuk komponen UI
import 'package:google_fonts/google_fonts.dart'; // Mengimpor font dari Google Fonts untuk penggunaan font khusus
import 'package:intl/intl.dart'; // Mengimpor paket untuk format angka, digunakan untuk memformat harga produk

// Halaman DetailPage yang menampilkan informasi detail produk
class DetailPage extends StatelessWidget {
  // Mendeklarasikan parameter yang diperlukan untuk menampilkan detail produk
  final String productName;
  final String productDescription;
  final double price;
  final String imageUrl;

  // Konstruktor untuk menerima data produk dari halaman sebelumnya
  const DetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Menggunakan Scaffold untuk struktur dasar halaman
    return Scaffold(
      appBar: AppBar(
        // Judul aplikasi di AppBar menggunakan nama produk
        title: Text(
          productName,
          style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold), // Menggunakan font Poppins untuk judul
        ),
        backgroundColor:
            kShrineBlue100, // Menggunakan warna yang sudah didefinisikan dalam colors.dart
      ),
      body: Padding(
        padding: const EdgeInsets.all(
            16.0), // Memberikan padding sekitar body halaman
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Menyusun elemen-elemen secara vertikal dan rata kiri
          children: [
            // Menampilkan gambar produk
            Center(
              child: Image.asset(
                imageUrl, // Menampilkan gambar produk berdasarkan URL yang diterima
                height: 200, // Menentukan tinggi gambar
                fit: BoxFit
                    .cover, // Mengatur agar gambar tetap sesuai dengan ukuran yang diberikan
              ),
            ),
            const SizedBox(
                height: 20.0), // Memberikan jarak antara gambar dan teks
            // Menampilkan nama produk
            Text(
              productName,
              style: GoogleFonts.poppins(
                fontSize: 24, // Ukuran font untuk nama produk
                fontWeight: FontWeight.bold, // Membuat teks menjadi tebal
                color:
                    kShrineBlue500, // Menggunakan warna biru yang sudah didefinisikan
              ),
            ),
            const SizedBox(
                height:
                    10.0), // Memberikan jarak antara nama produk dan deskripsi
            // Menampilkan deskripsi produk
            Text(
              productDescription,
              style: GoogleFonts.poppins(
                fontSize: 16, // Ukuran font untuk deskripsi
                color: Colors.grey[700], // Warna abu-abu untuk teks deskripsi
              ),
            ),
            const SizedBox(
                height:
                    20.0), // Memberikan jarak antara deskripsi dan harga produk
            // Menampilkan harga produk dengan format angka yang sesuai
            Text(
              'Price: \$ ${NumberFormat('#,##0').format(price)}', // Format harga dengan pemisah ribuan
              style: GoogleFonts.poppins(
                fontSize: 18, // Ukuran font untuk harga
                fontWeight: FontWeight.w600, // Menebalkan font harga
                color: const Color.fromARGB(
                    255, 68, 108, 192), // Warna biru untuk harga
              ),
            ),
            const Spacer(), // Menambahkan ruang kosong agar harga selalu berada di bagian bawah
          ],
        ),
      ),
    );
  }
}
