// import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:e_commerce_app/components/quantity_selector.dart';
import 'package:e_commerce_app/components/snackbar.dart';
import 'package:e_commerce_app/models/product_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  static const Color backgroundColor = Color.fromARGB(255, 248, 248, 248);

  final Product product;

  const CartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    // final favorites = context.read<CartProvider>();
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => showNotReadySnackBar(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 150,
        width: screenWidth * 0.95,
        child: Stack(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      padding: EdgeInsets.all(16),
                      margin: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 230, 230, 230),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        product.imagePath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.interTight(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${product.currentPrice.toStringAsFixed(2)}€',
                      style: GoogleFonts.interTight(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'size: 40',
                      style: GoogleFonts.interTight(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 12,
              bottom: 8,
              child: Container(
                width: 88,
                height: 36,
                padding: const EdgeInsets.only(bottom: 12, right: 12),
                child: QuantitySelector(
                  initialQuantity: 1,
                  onChanged: (quantity) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
