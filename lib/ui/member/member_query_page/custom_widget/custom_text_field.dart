import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeTextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        isDense: true,
        contentPadding:
            const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 5),
      ),
    );
  }
}
