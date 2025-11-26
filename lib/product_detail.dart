import 'package:e_commerce_app/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/models/product_list.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.product});

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  // Save selected size index
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Main Colors
    Color primaryOrange = const Color(0xFFD97038);
    Color bgColor = const Color(0xFFE1E2E6);

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // 1. Background and Image
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Back
                    Positioned(
                      top: 40,
                      left: 20,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    // Image of watch
                    Positioned(
                      bottom: 80,
                      child: SizedBox(
                        width: 200,
                        height: 220,
                        child: Image(
                          image: AssetImage(widget.product.imagePath),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // Indicator
                    Positioned(
                      bottom: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildDot(Colors.white),
                          const SizedBox(width: 8),
                          _buildDot(primaryOrange),
                          const SizedBox(width: 8),
                          _buildDot(Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Khoảng trắng bù trừ để phần card trắng bên dưới đè lên
              const Expanded(child: SizedBox()),
            ],
          ),

          // 2. Detail card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20), // Color Picker
                  // Product name
                  Text(
                    widget.product.name,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Vote rate
                  _buildStarRating(widget.product.rate),
                  const SizedBox(height: 16),

                  // Price and stock status
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  '${widget.product.currentPrice.toStringAsFixed(2)}€',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            if (widget.product.oldPrice != null) ...[
                              TextSpan(text: '   '), // Add space
                              TextSpan(
                                text:
                                    '${widget.product.oldPrice?.toStringAsFixed(2)}€',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const Text(
                        "Available in stock",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // About
                  const Text(
                    "About",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "The upgraded S6 SiP runs up to 20 percent faster, allowing apps to also launch 20 percent faster, while maintaining the same all-day 18-hour battery life.",
                    style: TextStyle(color: Colors.grey, height: 1.4),
                  ),
                  const SizedBox(height: 20),

                  // Choose Size
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(widget.product.option.length, (
                        index,
                      ) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSizeIndex = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            decoration: BoxDecoration(
                              color: selectedSizeIndex == index
                                  ? const Color(0xFFFFE8DE)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: selectedSizeIndex == index
                                    ? primaryOrange
                                    : Colors.grey.shade300,
                              ),
                            ),
                            child: Text(
                              widget.product.option[index],
                              style: TextStyle(
                                color: selectedSizeIndex == index
                                    ? primaryOrange
                                    : Colors.black54,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),

                  const Spacer(),

                  // Button Add to cart
                  SizedBox(
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
                        context.read<CartProvider>().add(widget.product);
                      },
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // 3. Color Picker
          Positioned(
            top:
                MediaQuery.of(context).size.height * 0.40 -
                50, // Adjust position
            right: 30,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildColorOption(const Color(0xFF3D3C4E), true),
                  _buildColorOption(Colors.black, false),
                  _buildColorOption(const Color(0xFFF4F4F4), false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget dot
  Widget _buildDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  // Widget color
  Widget _buildColorOption(Color color, bool isSelected) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(2), // Viền
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: isSelected ? Border.all(color: Colors.black, width: 1) : null,
      ),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: color == const Color(0xFFF4F4F4)
              ? Border.all(color: Colors.grey)
              : null,
        ),
        child: isSelected
            ? const Icon(Icons.check, size: 14, color: Colors.white)
            : null,
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          color: index < rating ? Colors.amber : Colors.grey,
          size: 20,
        );
      }),
    );
  }
}
