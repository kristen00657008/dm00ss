import 'package:dm00ss/providers/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonScrollView extends StatelessWidget {
  final ScrollController scrollController;
  final double maxBounce = 0.25;
  final Widget child;

  const CommonScrollView({
    super.key,
    required this.scrollController,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      var currentAppTheme = ref.watch(themeProvider);
      return NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollUpdateNotification) {
            if (scrollController.position.pixels <
                maxBounce * scrollController.position.viewportDimension * -1) {
              scrollController.position.animateTo(
                0,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
            if ((scrollController.position.pixels -
                    scrollController.position.maxScrollExtent) >
                maxBounce * scrollController.position.viewportDimension) {
              scrollController.position.animateTo(
                scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
          }
          return false;
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              padding: EdgeInsets.only(top: 10, bottom: 5),
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                color: currentAppTheme.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics(),
                ),
                child: InkWell(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: Container(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
