import 'package:flutter/foundation.dart';
import 'package:e_commerce_app/models/product_list.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Product> _items = [];

  List<Product> get items => List.unmodifiable(_items);

  bool isFavorite(int id) => _items.any((p) => p.id == id);

  void toggle(Product product) {
    if (isFavorite(product.id)) {
      _items.removeWhere((p) => p.id == product.id);
    } else {
      _items.add(product);
    }
    notifyListeners();
  }
}
