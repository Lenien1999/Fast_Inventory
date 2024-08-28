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
    required this.isTrue,
  });
  final String hintText;
  final IconData? icon;
  final ValidatorFunction? validator;
  final bool isTrue;
  final IconData? suffix_icon;
  final TextEditingController controller;

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
      decoration: InputDecoration(
          suffixIcon: isValid
              ? const Icon(Icons.check,
                  color: Color.fromARGB(
                      255, 8, 165, 13)) // Show checkmark if valid
              : widget.suffix_icon != null
                  ? Icon(widget.suffix_icon,
                      color: Colors.black) // Show original icon if invalid
                  : null,
          errorStyle: const TextStyle(
            color: primaryClr,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          hintText: widget.hintText,
          fillColor: Colors.white,
          border: const OutlineInputBorder(
              gapPadding: 0,
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 250, 246, 246))),
          hintStyle: const TextStyle(color: Color.fromARGB(255, 189, 186, 186)),
          prefixIcon: widget.isTrue
              ? Container(
                  padding: const EdgeInsets.all(0),
                  color: const Color.fromARGB(255, 221, 215, 215),
                  child: Icon(widget.icon, color: Colors.black))
              : null),
      onChanged: _validateInput,
    );
  }
}
