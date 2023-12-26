import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopButtonsWidget extends ConsumerStatefulWidget {
  final ThemeStyle themeStyle;

  const TopButtonsWidget({super.key, required this.themeStyle});

  @override
  ConsumerState<TopButtonsWidget> createState() => _TopButtonsWidgetState();
}

class _TopButtonsWidgetState extends ConsumerState<TopButtonsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        scrollDirection: Axis.horizontal,
        children: [
          buildButton(
            title: '查詢',
            onPressed: () {
              ref.read(pageProvider.notifier).pushPage(PageName.MemberQueryPage);
            },
          ),
          buildButton(
            title: '電話洽談紀錄',
            onPressed: () {},
          ),
          buildButton(
            title: '新增',
            onPressed: () {},
          ),
          buildButton(
            title: '修改',
            onPressed: () {},
          ),
          buildButton(
            title: '確認',
            onPressed: () {},
          ),
          buildButton(
            title: '取消',
            onPressed: () {},
          ),
          buildButton(
            title: '刪除',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget buildButton({required String title, VoidCallback? onPressed}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(title, style: TextStyle(fontSize: 15),),
      ),
    );
  }
}
