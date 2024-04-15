import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final double size;
  final String text;
  final Color col;
  final FontWeight weight;
  final TextAlign textAlign;

  const AppText({
    Key? key,
    this.size = 16,
    required this.text,
    this.col = Colors.black,
    this.weight = FontWeight.normal,
    this.textAlign=TextAlign.center
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: col,
        fontWeight: weight,
      ),
      textAlign: textAlign,
    );
  }
}