import 'package:flutter/material.dart';

class IconBox extends StatelessWidget {
  const IconBox({Key? key,required this.image}):super(key:key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      clipper: MyClipper(),
      child: Container(
        decoration: LoadImage(),
      ),

    );
  }
  BoxDecoration LoadImage() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover
        )
    );
  }
}

class MyClipper extends CustomClipper<Rect>{

  @override
  Rect getClip(Size size) {
  return const Rect.fromLTRB(0, 0, 50, 50);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}
