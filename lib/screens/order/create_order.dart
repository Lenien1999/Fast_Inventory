// ignore_for_file: must_be_immutable

import 'package:fast_inventory/screens/auth/textForm_widget.dart';
import 'package:fast_inventory/utils/color.dart';
import 'package:fast_inventory/utils/text_style.dart';
import 'package:fast_inventory/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CreateOrder extends StatelessWidget {
  CreateOrder({super.key});
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    final serchController = TextEditingController();
    return Scaffold(
      appBar: const CustomAppbar(
        isTrue: true,
        title: 'Create Order',
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            TextFielWidget(
                controller: serchController,
                hintText: 'Search for Name',
                isTrue: false),
            _createOrderWidget(),
            _appendOrderWidget(),
          ],
        ),
      ),
    );
  }

  _createOrderWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.02),
      height: _deviceHeight! * 0.3,
      width: _deviceWidth! * 0.9,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(209, 231, 221, 1),
      ),
      child: Column(
        children: [
          Text(
            "Create New Order",
            style: textStyle(secondaryClr, 25, FontWeight.w800),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: secondaryClr,
            onPressed: () {},
            child: Text(
              "(0)  Append Order(s)",
              style: textStyle(Colors.white, 18, FontWeight.w600),
            ),
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            color: const Color.fromRGBO(255, 152, 0, 1),
            onPressed: () {},
            child: Text(
              "(0)  Append Order(s)",
              style: textStyle(Colors.white, 18, FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  _appendOrderWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.05),
      height: _deviceHeight! * 0.6,
      width: _deviceWidth! * 0.9,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: const Color.fromARGB(255, 221, 218, 218).withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: const Offset(0, 3),
        ),
      ]),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: _deviceHeight! * 0.05),
            width: _deviceWidth! * 0.9,
            height: _deviceHeight! * 0.07,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(209, 231, 221, 1),
            ),
            child: Center(
              child: Text(
                "Append Order",
                style: textStyle(primaryClr, 18, FontWeight.w600),
              ),
            ),
          ),
          Text(
            "No Append Order Yet",
            style: textStyle(Colors.red, 14, FontWeight.normal),
          )
        ],
      ),
    );
  }
}
