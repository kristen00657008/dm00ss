import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Auto Size TextField Example',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Auto Size TextField Demo'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _textEditingControllerOne = TextEditingController();
  TextEditingController _textEditingControllerTwo = TextEditingController();
  TextEditingController _textEditingControllerThree = TextEditingController();
  TextEditingController _textEditingControllerFour = TextEditingController();
  TextEditingController _textEditingControllerFive = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: 200,
                    maxWidth: 300,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.amber),
                  ),
                  child: AutoSizeTextField(
                    controller: _textEditingControllerFive,
                    fullwidth: false,
                    minFontSize: 0,
                    maxLines: null,
                    style: TextStyle(fontSize: 50),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: const EdgeInsets.all(20)
                    ),
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    _textEditingControllerFive?.clear();
                  },
                  child: Text('clear'))
            ],
          ),
        ),
      ), // This trailing comma makes auto-formattig nicer for build methods.
    );
  }

  @override
  void initState() {
    super.initState();
    _textEditingControllerOne = TextEditingController();
    _textEditingControllerTwo = TextEditingController();
    _textEditingControllerThree = TextEditingController();
    _textEditingControllerFour = TextEditingController();
    _textEditingControllerFive = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingControllerOne?.dispose();
    _textEditingControllerTwo?.dispose();
    _textEditingControllerThree?.dispose();
    _textEditingControllerFour?.dispose();
    _textEditingControllerFive?.dispose();
    super.dispose();
  }
}