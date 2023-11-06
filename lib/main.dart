import 'package:dm00ss/route/router.dart';
import 'package:dm00ss/share_preference/shared_preference_service.dart';
import 'package:dm00ss/style/theme_provider.dart';
import 'package:dm00ss/ui/default_pages/login_page/login_page_ui_data.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as river;
import 'package:provider/provider.dart';

import 'screen_size.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesService.instance.init();

  runApp(river.ProviderScope(
    child: MultiProvider(
      providers: [
        ChangeNotifierProvider<ScreenSize>.value(
          value: ScreenSize(),
        ),
        ChangeNotifierProvider<ThemeProvider>.value(
          value: ThemeProvider().init(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    context.read<ScreenSize>().updateScreenSize(context);
    LoginPageUIData.instance.init(context);
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp.router(
        title: 'Flex Color Scheme Demo',
        theme: FlexColorScheme.light(
          primary: themeProvider.currentAppTheme.primary,
          secondary: themeProvider.currentAppTheme.secondary,
          textTheme: TextTheme(
            titleLarge: TextStyle(fontSize: 25.0),
            titleMedium: TextStyle(fontSize: 20.0),
            titleSmall: TextStyle(
                fontSize: 18.0, color: themeProvider.currentAppTheme.primary),
            labelLarge: TextStyle(fontSize: 25.0),
            bodyMedium: TextStyle(fontSize: 20.0),
          ),
        ).toTheme,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      );
    });
  }
}