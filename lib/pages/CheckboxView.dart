import 'package:flutter/material.dart';

class CheckboxView extends StatefulWidget {
  const CheckboxView({super.key});

  @override
  State<CheckboxView> createState() => _CheckboxViewState();
}

class _CheckboxViewState extends State<CheckboxView> {
  bool isCheck =true;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      checkColor: Colors.black,
      side: const BorderSide(
        color: Colors.white
      ),activeColor: Colors.white,
        value: isCheck, onChanged: (value) {
          setState(() {
            isCheck = value!;
          });
        },);
  }
}
