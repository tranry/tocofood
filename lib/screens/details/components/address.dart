import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:totofood/models/CounterController.dart';
class AddressWidget extends StatefulWidget {
  @override
  _AddressWidgetState createState() => _AddressWidgetState();
}

class _AddressWidgetState extends State<AddressWidget> {

  List<String> dataAdr=<String>[
    '94 trần vỹ ,hà nội',
    '96 dinh cong,ha noi',
    // Add more items for additional addresses
  ];
  late String? selectedAddress=dataAdr[0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<CounterController>().address.value=RxString(selectedAddress!).value;
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            color: Colors.white70,
            child: Text(
              'Địa chỉ :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            child: DropdownButton<String>(
              value: selectedAddress,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedAddress = newValue;
                  Get.find<CounterController>().address.value=RxString(selectedAddress!).value;
                });
              },
              items: dataAdr.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}