import 'package:dm00ss/providers/global_provider.dart';
import 'package:dm00ss/style/theme_style.dart';
import 'package:dm00ss/ui/default_pages/default_page/drawer_view.dart';
import 'package:dm00ss/widget/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonBackgroundView extends StatefulWidget {
  final Widget child;
  const CommonBackgroundView({super.key, required this.child});

  @override
  State<CommonBackgroundView> createState() => _CommonBackgroundViewState();
}

class _CommonBackgroundViewState extends State<CommonBackgroundView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      ThemeStyle currentAppTheme = ref.watch(themeProvider);
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: currentAppTheme.scaffoldColor2,
        ),
        child: Scaffold(
          drawer: DrawerView(),
          drawerEnableOpenDragGesture: false,
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      currentAppTheme.scaffoldColor1,
                      currentAppTheme.scaffoldColor2
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  CommonAppBar(),
                  Expanded(child: widget.child),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
