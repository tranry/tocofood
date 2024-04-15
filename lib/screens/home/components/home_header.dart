import 'package:flutter/material.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/screens/cart/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:totofood/widgets/app_text.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:get/get.dart';
class HomeHeader extends StatelessWidget {
  bool favourite = false;
  final CounterController counterController = Get.put(CounterController());

  HomeHeader({
    Key? key, required this.favourite
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          this.favourite ? const SearchField() : Hello(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 5,),Obx(() =>
              IconBtnWithCounter(
                numOfitem: counterController.count.value,
                svgSrc: "assets/icons/Cart Icon.svg",
                press: () => Navigator.pushNamed(context, CartScreen.routeName),
              )),
              SizedBox(width: 5,),
              IconBtnWithCounter(
                svgSrc: "assets/icons/Bell.svg",
                numOfitem: 3,
                press: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> getUserName() async
  {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getString("user").toString();
  }

  Widget Hello() {

    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/gif/bg.gif',width: 80,height: 80,fit: BoxFit.cover,), // Đường dẫn tới file GIF

        ],
      );
  }}