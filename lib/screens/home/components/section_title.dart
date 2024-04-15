import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
    required this.press,
    required this.all,
  }) : super(key: key);

  final String title;
  final GestureTapCallback press;
  final int all;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(18),
            color: Colors.black,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: all==1?const Text(
            "Xem Thêm",
            style: TextStyle(color: Color(0xFFBBBBBB)),
          ):const SizedBox.shrink(),
        ),
      ],
    );
  }
}
