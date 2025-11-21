import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem {
  final String iconPath;
  final Color? backgroundColor;
  final Color? iconColor;
  final String id; // Add category ID

  CategoryItem({
    required this.iconPath,
    required this.id,
    this.backgroundColor,
    this.iconColor,
  });
}

// Widget to display a single category
class Categorie extends StatelessWidget {
  final CategoryItem category;
  final bool isSelected;
  final VoidCallback onTap;

  const Categorie({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 4, left: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: isSelected
                  // ignore: deprecated_member_use
                  ? Colors.orange.withOpacity(0.3)
                  : (category.backgroundColor ??
                        const Color.fromARGB(255, 221, 220, 220)),
              borderRadius: BorderRadius.circular(8),
              border: isSelected
                  ? Border.all(color: Colors.orange, width: 2)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  spreadRadius: 0.1,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: IconButton(
                onPressed: onTap,
                icon: ImageIcon(
                  AssetImage(category.iconPath),
                  color: isSelected
                      ? Colors.orange
                      : (category.iconColor ??
                            const Color.fromARGB(255, 85, 85, 85)),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Categories_all extends StatelessWidget {
  final String selectedCategory;
  final Function(String) onCategorySelected;

  const Categories_all({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final List<CategoryItem> categories = [
      CategoryItem(iconPath: 'assets/icons/watch-smart.png', id: 'watch'),
      CategoryItem(iconPath: 'assets/icons/tshirt.png', id: 'tshirt'),
      CategoryItem(iconPath: 'assets/icons/bag.png', id: 'bag'),
      CategoryItem(iconPath: 'assets/icons/boot.png', id: 'boot'),
      CategoryItem(iconPath: 'assets/icons/glasses.png', id: 'glasses'),
    ];

    return SizedBox(
      height: 150,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Top Categories',
                style: GoogleFonts.interTight(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  overlayColor: Colors.white,
                ),
                onPressed: () => onCategorySelected('all'),
                child: Text(
                  'See all',
                  style: GoogleFonts.interTight(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.1, 0.9, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                margin: const EdgeInsets.only(left: 0, right: 0),
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Categorie(
                      category: categories[index],
                      isSelected: selectedCategory == categories[index].id,
                      onTap: () => onCategorySelected(categories[index].id),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
