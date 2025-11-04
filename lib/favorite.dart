import 'package:e_commerce_app/components/bottombar.dart';
import 'package:e_commerce_app/components/provider.dart';
import 'package:e_commerce_app/components/snackbar.dart';
import 'package:e_commerce_app/models/product_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FavoriteCard extends StatelessWidget {
  final Product product;

  const FavoriteCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final favorites = context.read<FavoritesProvider>();
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () => showNotReadySnackBar(context),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 230, 230, 230),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 150,
        width: screenWidth * 0.95,
        child: Row(
          children: [
            Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 230, 230, 230),
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(product.imagePath, fit: BoxFit.contain),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.interTight(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${product.currentPrice.toStringAsFixed(2)}€',
                      style: GoogleFonts.interTight(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    if (product.oldPrice != null)
                      Text(
                        '${product.oldPrice!.toStringAsFixed(2)}€',
                        style: GoogleFonts.interTight(
                          fontSize: 14,
                          color: Colors.grey[600],
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            IconButton(
              tooltip: 'Remove from favorites',
              icon: const Icon(Icons.delete, color: Colors.black),
              onPressed: () => favorites.toggle(product),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesProvider>().items;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorites',
          style: GoogleFonts.interTight(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 72,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'No favorites yet',
                    style: GoogleFonts.interTight(
                      fontSize: 18,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              itemBuilder: (context, index) =>
                  FavoriteCard(product: favorites[index]),
            ),
      bottomNavigationBar: const BottomBar(currentPage: 'favorites'),
    );
  }
}
