import 'package:flutter/material.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/Purchase.dart';

class PurchaseHistoryWidget extends StatefulWidget {
  static String routeName="/history";

  @override
  State<PurchaseHistoryWidget> createState() => _PurchaseHistoryWidgetState();
}

class _PurchaseHistoryWidgetState extends State<PurchaseHistoryWidget> {
  @override
  Widget build(BuildContext context) {
    // Sắp xếp purchases theo ngày mua hàng giảm dần
    purchases.sort((a, b) => b.purchaseDate.compareTo(a.purchaseDate));

    return Scaffold(
      appBar: AppBar(
        title: Text('Lích sử mua hàng'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                purchases.clear();
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: ListView.builder(
          itemCount: purchases.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(purchases[index].productName.tenSanPham),
              subtitle: Text(
                      'Ngày mua: ${purchases[index].purchaseDate.toString()}'
                      '\nĐịa chỉ: ${purchases[index].address.toString()}'
                      '\nSố lượng: ${purchases[index].count.toString()}'
                          '\nTổng tiền: \$${purchases[index].price.toStringAsFixed(2)}'

              ),
            );
          },
        ),
      ),
    );
  }
}