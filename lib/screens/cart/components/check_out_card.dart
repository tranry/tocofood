import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:totofood/components/default_button.dart';
import 'package:totofood/models/Cart.dart';
import 'package:get/get.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/models/Product.dart';
import 'package:totofood/models/Purchase.dart';
import 'package:totofood/screens/cart/components/cart_card.dart';
import 'package:totofood/screens/cart/components/payment_page.dart';
import 'package:totofood/screens/details/components/address.dart';
import '../../../constants.dart';
import '../../../models/QuanLyAnh.dart';
import '../../../size_config.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class CheckoutCard extends StatefulWidget {
   final String text;
   final Purchase product;
   const CheckoutCard({
    Key? key, required this.text,required this.product
  }) : super(key: key);

  @override
  State<CheckoutCard> createState() => _CheckoutCardState();
}
class _CheckoutCardState extends State<CheckoutCard> {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                const Spacer(),
                ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text("Thêm mã giảm giá"),
                    onPressed: () {
                      String textFieldValue = "";
                      showModalBottomSheet(
                          context: context,
                          builder: (builder) {
                            return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(20)),
                                child: SizedBox(
                                    height: 200, // Set a finite height
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          TextField(
                                            onChanged: (value) =>
                                                textFieldValue = value,
                                            decoration: const InputDecoration(
                                                labelText: "Nhập mã giảm giá"),
                                          ),
                                          Center(
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              width: 100,
                                              child: DefaultButton(
                                                col: kPrimaryColor,
                                                text: "Áp Dụng",
                                                press: ()  {
                                                  Get.find<CounterController>()
                                                      .updatePrice(10);
                                                  showCustomDialog(
                                                      context,
                                                      "Chúc mừng","Bạn đã áp dụng mã giảm giá thành công.");
                                                },
                                              ),
                                            ),
                                          )
                                        ])));
                          });
                    }),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            AddressWidget(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(() => Text(
                    '${Get.find<CounterController>().totalCartPrice.value.abs().toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.bodyMedium)),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Thanh Toán",
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
                      setState(() {
                        Future.delayed(Duration(seconds: 3),()  async {
                          if (widget.text.toString() == "Giỏ Hàng") {
                            int i=0;
                            demoCarts.forEach(
                              (element) {i++;
                                purchases.add(Purchase(productName: element.product, price: element.product.giaBan*element.numOfItem, count: element.numOfItem, purchaseDate: DateTime.now(), address: Get.find<CounterController>().address.value));
                              },
                            );
                            demoCarts.clear();
                        Get.find<CounterController>().count.value=0;
                        Get.find<CounterController>().updateTotalCartPrice();}
                          else purchases.add(widget.product);
                          await Get.to(()=>PaymentPage(ds: purchases));
                          Navigator.of(context).pop();

                        });
                      });purchases.clear();

                    },
                    col: kPrimaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showCustomDialog(BuildContext context, String? title,String? content) {
    bool isLoadingDialogOpen = true;

    showDialog(
      context: context,
      builder: (context) => const Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50,
        ),
      ),
    ).then((_) {
      isLoadingDialogOpen = false;
    });

    Future.delayed(Duration(seconds: 3), () {
      if (isLoadingDialogOpen) {
        Navigator.of(context).pop(); // Dismiss the loading dialog if it's still open
        showDialog(context: context, builder: (context) => AlertDialog(
          title: Text(title!),
          content: Text(content!),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the success dialog
                Navigator.of(context).pop(); // Dismiss the success dialog
              },
            ),
          ],
        ),);
      }
    });
  }
}
