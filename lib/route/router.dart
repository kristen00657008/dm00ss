import 'package:dm00ss/ui/default_pages/default_page/default_page.dart';
import 'package:dm00ss/ui/default_pages/login_page/login_page.dart';
import 'package:dm00ss/ui/member/member_query_page/member_query_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'homepage',
          builder: (BuildContext context, GoRouterState state) {
            return const DefaultPage();
          },
        ),
        GoRoute(
          path: 'MemberQueryPage',
          builder: (BuildContext context, GoRouterState state) {
            return const MemberQueryPage();
          },
        ),
      ],
    ),
  ],
);

enum PageName {
  FastNewsPage,
  MemberQueryPage
}