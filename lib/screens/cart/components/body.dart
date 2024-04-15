import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:totofood/models/Cart.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final CounterController counterController = Get.put(CounterController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CounterController>().updateTotalCartPrice();
  }
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Obx(()=>ListView.builder(
        itemCount: Get.find<CounterController>().count.value,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.idSanPham.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                demoCarts.removeAt(index);
                counterController.delete();
                counterController.updateTotalCartPrice();
              });
            },
            background: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),)
    );
  }
}
