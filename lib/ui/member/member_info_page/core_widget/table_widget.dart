import 'package:data_table_2/data_table_2.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/data/data.dart';
import 'package:dm00ss/ui/member/member_query_page/custom_widget/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TableWidget extends StatefulWidget {
  final ThemeStyle themeStyle;
  final MemberInfoTabs tab;
  final List<dynamic> items;

  const TableWidget(
      {super.key,
      required this.themeStyle,
      required this.tab,
      required this.items});

  @override
  State<TableWidget> createState() => _TableWidgetState();
}

class _TableWidgetState extends State<TableWidget> {
  final StateProvider<int> provider = StateProvider((ref) => 10);

  @override
  Widget build(BuildContext context) {
    List<String> columnTitles = widget.items.isNotEmpty
        ? getModelProperties(widget.items.first).keys.toList()
        : [];
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 5),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: widget.themeStyle.backgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Consumer(builder: (context, ref, _) {
            return Expanded(
              child: DataTable2(
                columnSpacing: 10,
                horizontalMargin: 15,
                minWidth: 1100,
                lmRatio: 1.3,
                //   columns: [],
                // rows:[],
                columns: columnTitles.map((title) {
                  return DataColumn2(
                      label: Center(child: Text(title)),
                      fixedWidth: getColumnWidth(title));
                }).toList(),
                rows: List<DataRow>.generate(
                  ref.watch(provider),
                  (index) {
                    return DataRow(
                      cells: columnTitles.map((title) {
                        if (title == "項次") {
                          return DataCell(
                              Center(child: Text((index + 1).toString())));
                        }
                        if (index < widget.items.length) {
                          var item = widget.items[index];
                          final properties = getModelProperties(item);
                          return DataCell(
                            Center(child: Text(properties[title].toString())),
                          );
                        } else {
                          return DataCell(
                            Center(child: Text("")),
                          );
                        }
                      }).toList(),
                    );
                  },
                ),
              ),
            );
          }),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                SizedBox(
                  width: 95,
                  height: 45,
                  child: CustomDropdownButton(
                    dataList: List.generate(10, (index) => ((index + 1) * 10)),
                    provider: provider,
                    backgroundColor: widget.themeStyle.backgroundColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
