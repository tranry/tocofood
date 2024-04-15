import 'package:totofood/components/coustom_bottom_nav_bar.dart';
import 'package:totofood/enums.dart';
import 'package:totofood/screens/favourite/components/body.dart';
import 'package:flutter/material.dart';

class FavourityScreen extends StatelessWidget {
  static String routeName = "/favourity";

  const FavourityScreen({super.key});
    @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}

