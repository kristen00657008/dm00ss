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
  final ScrollController _controller = ScrollController();
  final ScrollController _horizontalController = ScrollController();

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
                scrollController: _controller,
                horizontalScrollController: _horizontalController,
                columnSpacing: 10,
                horizontalMargin: 15,
                minWidth: 1100,
                lmRatio: 1.3,
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
                Spacer(),
                _ScrollXYButton(_controller, _horizontalController, '↑'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _ScrollXYButton extends StatefulWidget {
  const _ScrollXYButton(this.controller1, this.controller2, this.title);

  final ScrollController controller1;
  final ScrollController controller2;
  final String title;

  @override
  _ScrollXYButtonState createState() => _ScrollXYButtonState();
}

class _ScrollXYButtonState extends State<_ScrollXYButton> {
  bool _showScrollXY = false;

  @override
  void initState() {
    super.initState();
    widget.controller1.addListener(() {
      if (widget.controller2.position.pixels == 0 && widget.controller1.position.pixels == 0 && _showScrollXY) {
        setState(() {
          _showScrollXY = false;
        });
      } else if(!_showScrollXY) {
        setState(() {
          _showScrollXY = true;
        });
      }
    });
    widget.controller2.addListener(() {
      if (widget.controller2.position.pixels == 0 && widget.controller1.position.pixels == 0 && _showScrollXY) {
        setState(() {
          _showScrollXY = false;
        });
      } else if(!_showScrollXY) {
        setState(() {
          _showScrollXY = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _showScrollXY ? 1 : 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: OutlinedButton(
          onPressed: () {
            widget.controller1.animateTo(0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
            widget.controller2.animateTo(0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.grey[800]),
              foregroundColor: MaterialStateProperty.all(Colors.white)),
          child: Icon(Icons.arrow_back_rounded),
        ),
      ),
    );
  }
}
