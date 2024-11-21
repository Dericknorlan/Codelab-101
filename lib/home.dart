import 'package:codelab101/model/products.dart'; // Mengimpor model produk untuk digunakan di dalam halaman
import 'package:codelab101/model/products_repo.dart'; // Mengimpor repositori produk untuk memuat data produk
import 'package:flutter/material.dart'; // Mengimpor material design untuk komponen UI
import 'package:intl/intl.dart'; // Mengimpor paket untuk format angka, digunakan untuk memformat harga produk

import 'detail_page.dart'; // Mengimpor halaman DetailPage untuk menampilkan detail produk saat kartu ditekan

// Halaman utama yang menampilkan daftar produk dalam grid
class HomePage extends StatelessWidget {
  final Category category; // Kategori produk yang akan ditampilkan

  // Konstruktor untuk menerima kategori yang akan ditampilkan (default adalah kategori 'all')
  const HomePage({this.category = Category.all, super.key});
  
  // Membuat grid cards berdasarkan produk yang ada
  List<Card> _buildGridCards(BuildContext context) {
    // Memuat produk berdasarkan kategori
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    // Jika tidak ada produk, kembalikan daftar kosong
    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context); // Mendapatkan tema aplikasi untuk styling
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()); // Format harga produk

    return products.map((product) {
      // Membangun kartu produk
      return Card(
        clipBehavior: Clip.antiAlias, // Membuat sudut kartu membulat
        elevation: 0.0, // Tidak ada bayangan untuk kartu
        child: GestureDetector(
          onTap: () {
            // Navigasi ke halaman detail produk saat kartu ditekan
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(
                  productName: product.name,
                  productDescription: product.description ?? 'No description available.',
                  price: product.price,
                  imageUrl: 'shop_images/${product.assetName}', // Menggunakan URL gambar produk
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Menyusun elemen-elemen di kartu secara vertikal
            children: <Widget>[
              // Menampilkan gambar produk dengan rasio aspek 18:11
              AspectRatio(
                aspectRatio: 18 / 11, 
                child: Image.asset(
                  'shop_images/${product.assetName}', // Menampilkan gambar produk
                  fit: BoxFit.fitWidth, // Gambar akan mengisi lebar kartu
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0), // Memberikan padding pada teks
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Menyusun teks secara vertikal
                    children: <Widget>[
                      // Menampilkan nama produk dengan pengaturan overflow
                      Text(
                        product.name,
                        style: theme.textTheme.bodyLarge, // Menggunakan tema teks besar
                        softWrap: false, // Tidak memaksa pembungkus kata
                        overflow: TextOverflow.ellipsis, // Menambahkan elipsis jika teks terlalu panjang
                        maxLines: 1, // Menampilkan maksimal satu baris untuk nama produk
                      ),
                      const SizedBox(height: 4.0), // Memberikan jarak antara nama produk dan harga
                      // Menampilkan harga produk dengan format mata uang
                      Text(
                        formatter.format(product.price),
                        style: theme.textTheme.bodySmall, // Menggunakan tema teks kecil untuk harga
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(); // Mengembalikan daftar kartu produk
  }

  @override
  Widget build(BuildContext context) {
    // Menampilkan grid produk menggunakan GridView
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 2, // Menampilkan 2 kolom pada grid
        padding: const EdgeInsets.all(16.0), // Memberikan padding sekitar grid
        childAspectRatio: 8.0 / 9.0, // Menentukan rasio aspek untuk setiap kartu
        children: _buildGridCards(context), // Memanggil fungsi untuk membangun kartu produk
      ),
    );
  }
}
