import 'package:totofood/models/Product.dart';
import 'package:totofood/models/QuanLyAnh.dart';

class Purchase {
  final Product productName;
  final double price;
  final int count;
  final String address;
  final DateTime purchaseDate;

  Purchase({
    required this.productName,
    required this.price,
    required this.count,
    required this.purchaseDate,
    required this.address
  });

  @override
  String toString() {
    return 'Purchase{productName: $productName, price: $price, count: $count, address: $address, purchaseDate: $purchaseDate}';
  } // Hàm khởi tạo không tham số
  factory Purchase.defaultConstructor() {
    return Purchase(
      productName: Product.defaultConstructor(), // Khởi tạo một đối tượng Product mặc định
      price: 0.0,
      count: 1,
      purchaseDate: DateTime.now(),
      address: "Default Address",
    );
  }
}
final List<Purchase> purchases = [
];