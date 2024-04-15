import 'package:flutter/material.dart';
import 'package:totofood/components/product_card.dart';
import 'package:totofood/models/Product.dart';
import '../../../models/ProductController.dart';
import '../../../models/QuanLyAnh.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'package:get/get.dart';

class PopularProducts extends StatefulWidget {
  const PopularProducts({super.key});

  @override
  State<PopularProducts> createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  final productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (productController) {
        if (productController.demoProducts.isEmpty) {
          productController.initData(context); // Fetch data if it's not available

        }
        return Obx(() {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: SectionTitle(
                    title: "Sản phẩm phổ biến", press: () {}, all: 1),
              ),
              SizedBox(height: getProportionateScreenWidth(20)),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: productController.isLoading.value
                    ? Center(
                        child:
                            CircularProgressIndicator()) // Show a loading indicator while the data is being fetched
                    : Row(
                        children: List.generate(
                          productController.demoProducts.length,
                          (index) {
                            if (productController
                                .demoProducts[index].isPopular) {
                              return ProductCard(
                                hideButton: 1,
                                formKey: GlobalKey<FormState>(),
                                text: "Mua Ngay",
                                product: productController.demoProducts[index],
                              );
                            }
                            return SizedBox.shrink();
                          },
                        )..toList(),
                      ),
              )
            ],
          );
        });
      },
    );
  }
}
