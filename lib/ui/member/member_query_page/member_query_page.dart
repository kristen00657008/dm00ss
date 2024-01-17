import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/repository/memer_repository.dart';
import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/member/member_info_page/member_info_page_model.dart';
import 'package:dm00ss/ui/member/member_query_page/core_widget/main_expansion_widget.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_model.dart';
import 'package:dm00ss/widget/default_view.dart';
import 'package:dm00ss/widget/common_button.dart';
import 'package:dm00ss/widget/common_scroll_view.dart';
import 'package:flutter/material.dart';
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
    return DefaultView(
      child: Consumer(
        builder: (context, ref, _) {
          var currentAppTheme = ref.watch(themeProvider);
          return Column(
            children: [
              Expanded(
                child: CommonScrollView(
                  scrollController: model.scrollController,
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
              SizedBox(height: 5),
              buildBottomBtn(currentAppTheme, ref),
            ],
          );
        },
      ),
    );
  }

  Widget buildBottomBtn(ThemeStyle currentAppTheme, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: MaterialCommonButton(
            backgroundColor: currentAppTheme.secondary,
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
            backgroundColor: currentAppTheme.primary,
            text: "查詢",
            onTap: () {
              model.search(ref);
              String memberID = model.memberIdController1.text;
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
