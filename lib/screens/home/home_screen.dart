import 'package:totofood/size_config.dart';
import 'package:flutter/material.dart';
import 'package:totofood/components/coustom_bottom_nav_bar.dart';
import 'package:totofood/enums.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
