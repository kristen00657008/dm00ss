import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  const CustomListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListTile(
        leading: null,
        title: Text(title),
      ),
    );
  }
}
