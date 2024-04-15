
import 'package:totofood/models/QuanLyAnh.dart';

import 'Product.dart';

class Cart {
  final Product product;
  int numOfItem;

  Cart({required this.product, required this.numOfItem});
  void incrementItem(int i) {
    this.numOfItem = (this.numOfItem ?? 1) + i; // Initialize if null and increment
  }
}

// Demo data for our cart

List<Cart> demoCarts = [
];
