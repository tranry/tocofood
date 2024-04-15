import 'package:totofood/pages/CheckboxView.dart';
import 'package:totofood/pages/FrostedGlassBox.dart';
import 'package:totofood/widgets/AppColor.dart';
import 'package:totofood/widgets/app_text.dart';
import 'package:flutter/material.dart';

class WellComeBack extends StatelessWidget {
   WellComeBack({Key?key}):super(key: key);
  List image=[
    "fbicon.png",
    "google.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Image.asset('assets/images/logocotowhite.png',width: 120,),

          ),
          const SizedBox(
            height: 50
          )
          ,Container(
            margin: const EdgeInsets.only(left: 15),
          width: 250,
            child: const AppText(text: "CHÀO MỪNG BẠN ĐẾN VỚI COTO",size: 25,weight: FontWeight.bold,col: AppColor.whiteLow,textAlign: TextAlign.center),

          ),
          const SizedBox(
              height: 80
          ),
          const FrostedGlassBox(height: 50, width: 250, child: AppText(text: "Đăng Nhập",col: AppColor.whiteHigh,size: 16)),
          const SizedBox(
              height: 40
          ),
          const FrostedGlassBox(height: 50, width: 250,opacityleft: 0.9,opacityright: 0.9,child: AppText(text: "Đăng Ký",col: Colors.black,size: 16,),),
          const SizedBox(
              height: 30
          ),SocialMediaView()
        ],
      );
  }
  Widget SocialMediaView()
  {
    return Container(
      margin: const EdgeInsets.only(top: 70,bottom: 30,left: 15),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CheckboxView(),
              AppText(text: "Tôi đồng ý với Điều Khoản và Điều Kiện",col: Colors.white,),
            ],
          ),

          AppText(text: "& Chính sách quyền riêng tư.",col: Colors.white,)
        ],
      )

    );
  }
}
