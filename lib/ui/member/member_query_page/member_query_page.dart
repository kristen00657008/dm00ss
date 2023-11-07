import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/ui/member/member_query_page/page_widget/date_expansion_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/page_widget/info_expansion_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/page_widget/main_expansion_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/page_widget/member_expansion_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/page_widget/other_expansion_widget.dart';
import 'package:dm00ss/widget/common_button.dart';
import 'package:dm00ss/widget/common_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as pro;
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MemberQueryPage extends ConsumerStatefulWidget {
  const MemberQueryPage({super.key});

  @override
  ConsumerState<MemberQueryPage> createState() => _MemberQueryPageState();
}

class _MemberQueryPageState extends ConsumerState<MemberQueryPage> {
  late MemberQueryModel model;

  @override
  void initState() {
    super.initState();
    model = MemberQueryModel.getInstance();
    model.init();
  }

  @override
  Widget build(BuildContext context) {
    return pro.Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            context.read<ThemeProvider>().currentAppTheme.scaffoldColor2,
      ));
      return Column(
        children: [
          Expanded(
            child: CommonScrollView(
              scrollController: model.scrollController,
              child: InkWell(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.zero,
                  children: [
                    MainExpansionWidget(model: model),
                    // MemberExpansionWidget(model: model),
                    // DateExpansionWidget(model: model),
                    // InfoExpansionWidget(model: model),
                    // OtherExpansionWidget(model: model),
                  ],
                ),
              ),
            ),
          ),
          buildBottomBtn(themeProvider, ref),
        ],
      );
    });
  }

  Widget buildBottomBtn(ThemeProvider themeProvider, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: MaterialCommonButton(
            backgroundColor: themeProvider.currentAppTheme.secondary,
            text: "重填",
            onTap: () {
              setState(() {
                model.clear(ref);
              });
            },
          ),
        ),
        Expanded(
          child: MaterialCommonButton(
            backgroundColor: themeProvider.currentAppTheme.primary,
            text: "查詢",
            onTap: () {
              model.search(ref);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }
}
