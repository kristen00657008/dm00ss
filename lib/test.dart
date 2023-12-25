import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Height Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row Height Demo'),
      ),
      body: IntrinsicHeight(
        child: Row(
          children: [
            // 左边的内容
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[300],),
                // color: Colors.grey[300],
                height: double.infinity,
                child: Text(
                  '左边内容',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
            // 右边的内容
            Flexible(
              child: Container(
                color: Colors.grey[500],
                child: Text(
                  '这是一个较长的文本内容，这是一个较长的文本内容，这是一个较长的文本内容，这是一个较长的文本内容。',
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
