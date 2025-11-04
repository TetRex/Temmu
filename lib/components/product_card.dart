import 'package:e_commerce_app/components/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatefulWidget {
  final String productName;
  final String imagePath;
  final double currentPrice;
  final double? oldPrice; // Optional old price
  final int? discountPercent; // Optional discount percentage
  final VoidCallback? onTap; // Optional tap handler
  final VoidCallback? onFavoritePressed; // Optional favorite handler

  const ProductCard({
    super.key,
    required this.productName,
    required this.imagePath,
    required this.currentPrice,
    this.oldPrice,
    this.discountPercent,
    this.onTap,
    this.onFavoritePressed,
  });

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => showNotReadySnackBar(context, message: 'Unknown error'),
      child: Container(
        margin: const EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 230,
              width: screenWidth * 0.42,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Top row with discount badge and favorite button
                  Row(
                    children: [
                      // Discount badge (only show if discount exists)
                      if (widget.discountPercent != null)
                        Container(
                          margin: const EdgeInsets.only(top: 6, left: 12),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            '${widget.discountPercent}% OFF',
                            style: GoogleFonts.interTight(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      const Spacer(),
                      // Favorite button
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        margin: const EdgeInsets.only(right: 12, top: 8),
                        height: 32,
                        width: 32,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            setState(() {
                              isFavorite = !isFavorite;
                            });
                            widget.onFavoritePressed?.call();
                          },
                          icon: Icon(
                            isFavorite ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: isFavorite ? Colors.red : Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Product image
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Product name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.interTight(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        Text(
                          '${widget.currentPrice.toStringAsFixed(2)}€',
                          style: GoogleFonts.interTight(
                            color: Colors.green[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (widget.oldPrice != null)
                          Text(
                            '${widget.oldPrice!.toStringAsFixed(2)}€',
                            style: GoogleFonts.interTight(
                              color: Colors.grey[600],
                              fontSize: 13,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey[600],
                              decorationThickness: 2,
                            ),
                          ),
                      ],
                    ),
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
