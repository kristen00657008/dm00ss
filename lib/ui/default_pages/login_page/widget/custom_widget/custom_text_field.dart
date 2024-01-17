import 'package:dm00ss/ui/default_pages/login_page/login_page_ui_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_field.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final FocusNode textFieldFocusNode;
  final LoginPageUIData loginPageUIData;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.textFieldFocusNode,
    required this.loginPageUIData,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CustomField(
      loginPageUIData: loginPageUIData,
      child: TextField(
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
        ],
        keyboardType: TextInputType.emailAddress,
        focusNode: textFieldFocusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding: EdgeInsets.all(10.0),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: Colors.black12,
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}