import 'package:totofood/components/product_card.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/ProductController.dart';
import 'package:totofood/models/Purchase.dart';
import 'package:totofood/screens/cart/components/payment_page.dart';
import 'package:totofood/screens/home/components/section_title.dart';
import 'package:totofood/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../models/Product.dart';


class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  final productController = Get.put(ProductController());

  void onBuyButtonPressed(Product product) {
    setState(() {
      productController.demoProducts.remove(product); // Remove the product from the list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30)),
            child:
                SectionTitle(title: "Sản Phẩm Yêu Thích", press: () {}, all: 0),
          ),
          SizedBox(height: getProportionateScreenWidth(10)),
          GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: 2,
              childAspectRatio: 0.66,
              children: [
                for (int i=0;i<productController.demoProducts.length;i++)
                  if (productController.demoProducts[i].isPopular && productController.demoProducts[i].isFavourite)
                    ProductCardWithUniqueTag(
                      product: productController.demoProducts[i],
                    ),
              ]),
        ],
      ),
    );
  }
}

class ProductCardWithUniqueTag extends StatelessWidget {
  final Product product;

  const ProductCardWithUniqueTag({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductCard(
      hideButton: 0,
      formKey: GlobalKey<FormState>(),
      text: "Mua Ngay",
      product: product,
      press: () {
        showDialog(
          context: context,
          builder: (context) => const Center(
            child: SpinKitChasingDots(
              color: Colors.white,
              size: 50,
            ),
          ),
        );
        Future.delayed(Duration(seconds: 3), () {
          final purchases = <Purchase>[
            Purchase(
              productName: product,
              price: product.giaBan,
              count: 1,
              purchaseDate: DateTime.now(),
              address: Get.find<CounterController>().address.value,
            )
          ];
          Get.to(()=>PaymentPage(ds: purchases));
        });
      },
    );
  }
}