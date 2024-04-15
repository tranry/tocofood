import 'package:flutter/material.dart';
import 'package:totofood/components/rounded_icon_btn.dart';
import 'package:totofood/models/CounterController.dart';
import 'package:totofood/models/Product.dart';
import 'package:get/get.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDots extends StatefulWidget {
  const ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  _ColorDotsState createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int selectedColor = 3;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CounterController>().countItem.value=1;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text('Giá : ''${widget.product.giaBan.toString()}đ',
            style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 18),
          ),SizedBox(height: 10,),
          Row(
            children: [
              // ...List.generate(
              //   product.colors.length,
              //   (index) => ColorDot(
              //     color: product.colors[index],
              //     isSelected: index == selectedColor,
              //   ),
              // ),

              Text('Số Lượng : ',style: TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              RoundedIconBtn(
                icon: Icons.remove,
                press: () {
                  setState(() {
                    if (Get.find<CounterController>().countItem.value > 1) {
                      Get.find<CounterController>().countItem.value--;
                    }
                  });
                },
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
          Obx(() => Text('${Get.find<CounterController>().countItem.value}')),
              SizedBox(width: getProportionateScreenWidth(20)),
              RoundedIconBtn(
                icon: Icons.add,
                showShadow: true,
                press: () {
                  setState(() {
                    Get.find<CounterController>().countItem.value++;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border:
            Border.all(color: isSelected ? kPrimaryColor : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
