import 'package:totofood/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  removeToken()async{
    final prefs= await SharedPreferences.getInstance();
    prefs.clear();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const ProfilePic(),
          const SizedBox(height: 20),
          ProfileMenu(
            text: "Thông Tin Người Dùng",
            icon: "assets/icons/User Icon.svg",
            press: () => {

            },
          ),
          ProfileMenu(
            text: "Thông Báo",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Cài Đặt",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Yêu Cầu Hỗ Trợ",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Đăng Xuất",
            icon: "assets/icons/Log out.svg",
            press: () {
              removeToken();
              Navigator.pushNamedAndRemoveUntil(context, SignInScreen.routeName,(route) => false,);},
          ),
        ],
      ),
    );
  }
}
