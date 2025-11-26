import 'package:e_commerce_app/components/empty.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/components/bottombar.dart';
import 'package:e_commerce_app/components/cart_item.dart';
import 'package:e_commerce_app/providers/cart_provider.dart';

dynamic bgcolor = Colors.white;

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Color primaryOrange = const Color(0xFFD97038);
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
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) =>
                        CartItem(product: cartItems[index]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                const Cart(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

      bottomNavigationBar: BottomBar(currentPage: 'cart'),
    );
  }
}
