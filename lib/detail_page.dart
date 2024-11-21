import 'package:codelab101/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';


class DetailPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double price;
  final String imageUrl;

  const DetailPage({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productName,
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: kShrineBlue100,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Center(
              child: Image.asset(
                imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            // Product Name
            Text(
              productName,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kShrineBlue500,
              ),
            ),
            const SizedBox(height: 10.0),
            // Product Description
            Text(
              productDescription,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20.0),
            // Product Price
            Text(
              'Price: Rp. ${NumberFormat('#,##0').format(price)}',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 68, 108, 192),
              ),
            ),
            const Spacer(),
            // Buy Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle buy action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Product $productName added to cart!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 68, 108, 192),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 15.0,
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
