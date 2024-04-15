import 'package:totofood/components/coustom_bottom_nav_bar.dart';
import 'package:totofood/enums.dart';
import 'package:flutter/material.dart';
import 'package:totofood/screens/message/components/body.dart';

class MessageScreen extends StatelessWidget {
  static String routeName = "/message";

  const MessageScreen({super.key});
    @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.message),
    );
  }
}

