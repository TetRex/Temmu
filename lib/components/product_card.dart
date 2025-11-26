import 'package:e_commerce_app/product_detail.dart';
import 'package:e_commerce_app/providers/favorites_provider.dart';
import 'package:e_commerce_app/models/product_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final VoidCallback? onFavoritePressed;

  const ProductCard({super.key, required this.product, this.onFavoritePressed});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    final product = widget.product;
    final favorites = context.watch<FavoritesProvider>();
    final bool isFav = favorites.isFavorite(product.id);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) =>
                ProductDetailsPage(product: product),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      },
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
                      if (product.discountPercent != null)
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
                            '${product.discountPercent}% OFF',
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
                            context.read<FavoritesProvider>().toggle(product);
                          },
                          icon: Icon(
                            isFav ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: isFavorite
                                ? const Color.fromARGB(255, 0, 0, 0)
                                : const Color.fromARGB(255, 187, 33, 33),
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
                        image: AssetImage(product.imagePath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // Product name
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      product.name,
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
                          '${product.currentPrice.toStringAsFixed(2)}€',
                          style: GoogleFonts.interTight(
                            color: Colors.green[700],
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        if (product.oldPrice != null)
                          Text(
                            '${product.oldPrice!.toStringAsFixed(2)}€',
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
