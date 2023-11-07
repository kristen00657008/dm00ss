import 'package:dm00ss/style/theme_provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as pro;

class CustomDropdownButton extends StatelessWidget {
  final List<String> dataList;
  final StateProvider<String> provider;

  const CustomDropdownButton(
      {super.key, required this.dataList, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return pro.Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            items: dataList
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            value: ref.watch(provider),
            onChanged: (value) {
              ref.read(provider.notifier).state = value ?? dataList.first;
            },
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                color: themeProvider.currentAppTheme.fieldBackgroundColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.black54,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 45,
              selectedMenuItemBuilder: (ctx, child) {
                return Container(
                  color: Colors.grey,
                  child: child,
                );
              },
              // padding: EdgeInsets.only(left: 14, right: 14),
            ),
          ),
        );
      });
    });
  }
}
