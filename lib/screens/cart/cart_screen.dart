import 'package:flutter/material.dart';
import 'package:totofood/models/Cart.dart';
import 'package:get/get.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/models/Purchase.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";

  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Body(),
      bottomNavigationBar:  CheckoutCard(text: "Giỏ Hàng",product: Purchase.defaultConstructor()),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          const Text(
            "Giỏ Hàng",
            style: TextStyle(color: Colors.black),
          ),Obx(() => Text('Sản Phẩm: ${Get.find<CounterController>().count.value}',
          style: Theme.of(context).textTheme.bodySmall)),
        ],
      ),
    );
  }
}
