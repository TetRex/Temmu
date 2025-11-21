import 'package:e_commerce_app/components/empty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/components/bottombar.dart';
import 'package:e_commerce_app/components/cart_item.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';

dynamic bgcolor = Colors.white;
// dynamic fgcolor = Colors.deepOrange;
// dynamic buttoncolor = Color.fromARGB(255, 100, 100, 100);

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartProvider>().items;

    return Scaffold(
      backgroundColor: bgcolor,

      appBar: AppBar(
        title: Text(
          'My Cart',
          style: GoogleFonts.interTight(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),

      body: cartItems.isEmpty
          ? Empty(text: 'No Products in Cart', icon: Icons.add_business)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cartItems.length,
              itemBuilder: (context, index) =>
                  CartItem(product: cartItems[index]),
            ),

      bottomNavigationBar: BottomBar(currentPage: 'cart'),
    );
  }
}
