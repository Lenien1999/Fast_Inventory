// ignore_for_file: non_constant_identifier_names

import 'package:fast_inventory/utils/color.dart';
import 'package:flutter/material.dart';

typedef ValidatorFunction = String? Function(String?);

class TextFielWidget extends StatefulWidget {
  const TextFielWidget({
    super.key,
    required this.controller,
    this.validator,
    this.icon,
    required this.hintText,
    this.suffix_icon,
    this.isPasswordField = false,
  });

  final String hintText;
  final IconData? icon;
  final ValidatorFunction? validator;

  final IconData? suffix_icon;
  final TextEditingController controller;
  final bool isPasswordField;

  @override
  State<TextFielWidget> createState() => _TextFielWidgetState();
}

class _TextFielWidgetState extends State<TextFielWidget> {
  bool isValid = false;

  void _validateInput(String? value) {
    final validationResult = widget.validator?.call(value);
    setState(() {
      isValid = validationResult == null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPasswordField ? true : false,
      decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isValid)
                const Icon(
                  Icons.check,
                  color: Color.fromARGB(255, 8, 165, 13),
                ),
            ],
          ),
          errorStyle: const TextStyle(
            color: primaryClr,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          hintText: widget.hintText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primaryClr),
          ),
          hintStyle: const TextStyle(color: Color.fromARGB(255, 189, 186, 186)),
          prefixIcon: Icon(widget.icon, color: Colors.black)),
      onChanged: _validateInput,
    );
  }
}
