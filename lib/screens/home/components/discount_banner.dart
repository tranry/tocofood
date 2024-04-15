import 'package:flutter/material.dart';

import '../../../size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(30),
        vertical: getProportionateScreenWidth(5),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECDF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text.rich(
            TextSpan(
              style: const TextStyle(color: Color(0xffFF7643)),
              children: [

                TextSpan(
                  text: "Siêu Sale 02/02\n",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "Giảm tới 20%",
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 35,bottom: 5),
            child: Image.asset('assets/images/logocoto.png',width: 70,height: 50,
            ),
          )
        ],
      ),
    );
  }
}
