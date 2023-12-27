import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row Height Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DataTable2SimpleDemo(),
    );
  }
}

class DataTable2SimpleDemo extends StatelessWidget {
  const DataTable2SimpleDemo();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
              columnSpacing: 10,
              horizontalMargin: 20,
              minWidth: 600,
              lmRatio: 1.8,
              columns: const [
                DataColumn2(
                  label: Text('項次'),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  label: Text('Column A'),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Text('Column B'),
                ),
                DataColumn(
                  label: Text('Column C'),
                ),
                DataColumn(
                  label: Text('Column D'),
                ),
                DataColumn2(
                  label: Text('Column NUMBERS'),
                  numeric: true,
                  size: ColumnSize.L,
                ),
              ],
              rows: List<DataRow>.generate(
                  100,
                      (index) => DataRow(cells: [
                        DataCell(Text((index+1).toString())),
                    DataCell(TextField()),
                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                    DataCell(Text('D' * (15 - (index + 10) % 10))),
                    DataCell(Text(((index + 0.1) * 25.4).toString()))
                  ]))),
        ),
      ),
    );
  }
}
