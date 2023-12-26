import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/list_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/tab_bar_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/top_buttons_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/member_info_page_model.dart';
import 'package:dm00ss/widget/common_background_view.dart';
import 'package:dm00ss/widget/common_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberInfoPage extends ConsumerStatefulWidget {
  const MemberInfoPage({super.key});

  @override
  ConsumerState<MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends ConsumerState<MemberInfoPage>
    with SingleTickerProviderStateMixin {
  late MemberInfoModel model;

  @override
  void initState() {
    super.initState();
    model = MemberInfoModel.getInstance();
    model.init(this);
  }

  @override
  Widget build(BuildContext context) {
    return CommonBackgroundView(
      child: Consumer(builder: (context, ref, _) {
        ThemeStyle currentAppTheme = ref.watch(themeProvider);
        return Column(
          children: [
            TabBarWidget(themeStyle: currentAppTheme, model: model,),
            TopButtonsWidget(themeStyle: currentAppTheme),
            Expanded(
              child: TabBarView(
                controller: model.tabController,
                viewportFraction: 1.0,
                children: model.tabs.map((e) {
                  return CommonScrollView(
                    scrollController: ScrollController(),
                    child: ListWidget(
                      themeStyle: currentAppTheme,
                      data: model.getDataMap(e),
                    ),
                  );
                }).toList()
              ),
            ),
          ],
        );
      }),
    );
  }
}