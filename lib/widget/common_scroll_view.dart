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
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            controller: scrollController,
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            child: Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight
              ),
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: currentAppTheme.backgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30.0),
                  topRight: const Radius.circular(30.0),
                ),
              ),
              child: child,
            ),
          );
        }),
      );
    });
  }
}
