import 'package:totofood/screens/favourite/components/popular_product.dart';
import 'package:totofood/screens/home/components/home_header.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(favourite: true,),
            SizedBox(height: getProportionateScreenWidth(10)),
            const PopularProducts(),
            SizedBox(height: getProportionateScreenWidth(30)),
          ],

          ),
        ));
  }
}
