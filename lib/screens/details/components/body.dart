import 'package:flutter/material.dart';
import 'package:totofood/components/default_button.dart';
import 'package:totofood/models/Cart.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/Purchase.dart';
import 'package:totofood/models/QuanLyAnh.dart';
import 'package:totofood/screens/cart/components/cart_card.dart';
import 'package:totofood/screens/cart/components/check_out_card.dart';
import 'package:totofood/screens/details/components/address.dart';
import 'package:totofood/size_config.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              Container(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    ButtonBuy("Thêm Vào Giỏ Hàng",(){
                      int index = demoCarts.indexWhere((cart) => cart.product == product);

                      if (index != -1) {
                        demoCarts[index].incrementItem(Get.find<CounterController>().countItem.value); // Increase the quantity if the product already exists
                      } else {
                        demoCarts.add(Cart(product: product, numOfItem: Get.find<CounterController>().countItem.value)); // Add new product if it doesn't exist
                      }
                      Get.find<CounterController>().updateCartCount(demoCarts.length);
                      Get.find<CounterController>().updateTotalCartPrice();
                    },kPrimaryColor.withOpacity(0.6)),
                    ButtonBuy("Mua Ngay",(){
                      Cart cartItem= Cart(product: product,numOfItem: Get.find<CounterController>().countItem.value);
                      _showBottomSheet(context,cartItem);
                      Get.find<CounterController>().updateOneCartPrice(cartItem);

                    },kPrimaryColor),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
void showCustomDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Thông báo'),
        content: Text('Sản phẩm đã được thêm vào giỏ hàng.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },);
}

void _showBottomSheet(BuildContext context, Cart product) {
  showModalBottomSheet(
    context: context,
    builder: (builder) {
      Purchase purchase=Purchase(productName: product.product, price: Get.find<CounterController>().totalCartPrice.value, count: product.numOfItem, purchaseDate: DateTime.now(), address: Get.find<CounterController>().address.value);
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SizedBox(

          height: 400, // Set a finite height
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Your child widgets here
              SizedBox(height: 30,),
              CartCard(cart: product),
               CheckoutCard(text: "Mua Ngay",product: purchase),

            ],
          ),
        ),
      );
    },
  );
}
Container ButtonBuy(String text,Function? fun,Color col) {
  return Container(
    color: Colors.transparent,
    child: Padding(
      padding: EdgeInsets.only(
        left: SizeConfig.screenWidth * 0.20,
        right: SizeConfig.screenWidth * 0.20,
        top: 10,bottom: 10
      ),
      child: DefaultButton(
        text: text,
        press: fun,
        col:col
      ),
    ),
  );
}