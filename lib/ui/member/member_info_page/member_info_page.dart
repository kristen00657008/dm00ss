import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/repository/memer_repository.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/list_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/tab_bar_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/table_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/core_widget/top_buttons_widget.dart';
import 'package:dm00ss/ui/member/member_info_page/member_info_page_model.dart';
import 'package:dm00ss/widget/common_background_view.dart';
import 'package:dm00ss/widget/default_view.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/data.dart';
import 'model/first_member_data_model.dart';
import 'model/promotion_data_model.dart';

class MemberInfoPage extends ConsumerStatefulWidget {
  const MemberInfoPage({super.key});

  @override
  ConsumerState<MemberInfoPage> createState() => _MemberInfoPageState();
}

class _MemberInfoPageState extends ConsumerState<MemberInfoPage>
    with SingleTickerProviderStateMixin {
  late MemberInfoModel model;
  late EasyRefreshController _controller;
  @override
  void initState() {
    super.initState();
    model = MemberInfoModel.getInstance();
    model.init(this);
    _controller = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultView(
      child: Consumer(builder: (context, ref, _) {
        ThemeStyle currentAppTheme = ref.watch(themeProvider);
        return Column(
          children: [
            TabBarWidget(
              themeStyle: currentAppTheme,
              model: model,
            ),
            TopButtonsWidget(themeStyle: currentAppTheme),
            Expanded(
              child: TabBarView(
                physics: model.tabController.index < 5
                    ? AlwaysScrollableScrollPhysics()
                    : NeverScrollableScrollPhysics(),
                controller: model.tabController,
                viewportFraction: 1.0,
                children: buildTabBarViewChildren(currentAppTheme),
              ),
            ),
          ],
        );
      }),
    );
  }

  List<Widget> buildTabBarViewChildren(ThemeStyle themeStyle) {
    return MemberInfoTabs.values.map((tab) {
      if(tab.isDataTable) {
        switch (tab) {
          case MemberInfoTabs.autoOrder:
          case MemberInfoTabs.collectionDetails:
          case MemberInfoTabs.promotion:
            return TableWidget(
              themeStyle: themeStyle,
              tab: tab,
              items: promotionData,
            );
          case MemberInfoTabs.courseRecords:
          case MemberInfoTabs.firstMembers:
            return TableWidget(
              themeStyle: themeStyle,
              tab: tab,
              items: firstMemberData,
            );
          default:
            return FlutterLogo();
        }
      } else {
        return CommonBackgroundView(
          child: EasyRefresh(
            controller: _controller,
            header:  MaterialHeader(
              clamping: false,
              position: IndicatorPosition.above,
              triggerOffset: 30,
              processedDuration: Duration(microseconds: 200)
            ),
            onRefresh: () async {
              MemberRepository().queryMember("DM123349").listen((event) {
                if(event.isSuccess) {
                  MemberInfoModel.getInstance().queryMemberBean = event;
                  setState(() {});
                }
                _controller.finishRefresh();
              });
            },
            child: ListWidget(
              themeStyle: themeStyle,
              data: tab.data,
            ),
          ),
        );
      }
    }).toList();
  }
}
