import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Single View Example'),
        ),
        body: CustomSingleView(
          child: Column(
            children: List.generate(50, (index) {
              return ListTile(
                title: Text('Item $index'),
              );
            }),
          ),
        ),
      ),
    );
  }
}

class CustomSingleView extends StatelessWidget {
  final Widget child;

  CustomSingleView({required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Container(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            padding: EdgeInsets.only(top: 20),
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(30.0),
                topRight: const Radius.circular(30.0),
              ),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
