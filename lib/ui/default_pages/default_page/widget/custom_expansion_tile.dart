import 'package:flutter/material.dart';

class CustomExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final VoidCallback? onTap;

  const CustomExpansionTile(
      {super.key, required this.title, required this.children, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: InkWell(
            onTap: onTap,
            child: Text(title),
          ),
          collapsedTextColor: Colors.black,
          children: children,
        ),
      ),
    );
  }
}
