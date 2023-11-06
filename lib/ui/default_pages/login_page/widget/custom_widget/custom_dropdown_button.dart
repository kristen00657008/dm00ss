import 'package:dm00ss/ui/default_pages/login_page/login_page_ui_data.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import 'custom_field.dart';

class CustomDropdownButton extends StatefulWidget {
  final LoginPageUIData loginPageUIData;

  const CustomDropdownButton({
    super.key,
    required this.loginPageUIData,
  });

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  final List<String> companyNameList = ["000", "02", "1"];
  String currentCompanyName = "000";

  @override
  Widget build(BuildContext context) {
    return CustomField(
      loginPageUIData: widget.loginPageUIData,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          items: companyNameList
              .map((String item) => DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ))
              .toList(),
          value: currentCompanyName,
          onChanged: (String? value) {
            setState(() {
              currentCompanyName = value ?? "000";
            });
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: 160,
            padding: const EdgeInsets.only(left: 14, right: 14),
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                // color: Colors.black26,
              ),
            ),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down_sharp,
            ),
            iconSize: 25,
            // iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
            openMenuIcon: Icon(
              Icons.arrow_drop_up,
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 400,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            height: 40,
            // customHeights: [30,30,30],
            selectedMenuItemBuilder: (ctx, child) {
              return Container(
                color: Colors.grey,
                child: child,
              );
            },
            // padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );
  }
}