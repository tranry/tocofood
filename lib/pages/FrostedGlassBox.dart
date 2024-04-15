import 'dart:ui';

import 'package:totofood/screens/sign_in/sign_in_screen.dart';
import 'package:totofood/screens/sign_up/sign_up_screen.dart';
import 'package:flutter/material.dart';

class FrostedGlassBox extends StatelessWidget {
  const FrostedGlassBox({Key ? key, required this.child,
    required this.height,
    required this.width, this.opacityleft = 0.20, this.opacityright = 0.15})
      :super(key: key);
  final double width;
  final double height;
  final double opacityleft;
  final double opacityright;
  final child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: width,
        height: height,
        color: Colors.transparent,
        child: Stack(
          children: [
            //hiệu ứg mờ
            BackdropFilter(
              filter: ImageFilter.blur(
                  sigmaX: 4,
                  sigmaY: 4
              ),

            )
            //hiệu ứng chuyển màu
            , Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(opacityleft),
                      Colors.white.withOpacity(opacityright),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,

                  )
              ),

            ),
            Center(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    if (opacityleft == 0.9) {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    } else if (opacityleft == 1) {
                      return;
                    }
                    else {
                      Navigator.pushNamed(context, SignInScreen.routeName);
                    }
                  }, child: Container(
                  child: child,
                  width: 250,
                  height: 50,
                  margin: const EdgeInsets.only(top: 10),

                ),
                ),

              ),
            )

          ],
        ),
      ),
    );
  }
}
