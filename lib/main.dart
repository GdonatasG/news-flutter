import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_flutter/di/dependencies.dart';
import 'package:news_flutter/presentation/headlines/search/search_headlines_page.dart';
import 'package:news_flutter/presentation/headlines/top/top_headlines_page.dart';

void main() {
  runApp(Dependencies(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          colorScheme: ColorScheme.light(
            primary: Colors.teal,
            secondary: Colors.teal,
            error: const Color(0xffcf1a3b),
            inverseSurface: const Color(0xff121212),
            surfaceTint: Colors.white,
            outlineVariant: Colors.black.withOpacity(0.2),
          ),
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          }),
          typography: Typography.material2021(
              black: Typography.blackMountainView.copyWith(
                  titleLarge: Typography.blackMountainView.titleLarge
                      ?.copyWith(fontSize: 20.0))),
          dividerTheme: const DividerThemeData(space: 1.0)),
      darkTheme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          pageTransitionsTheme: const PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
          }),
          colorScheme: ColorScheme.dark(
              primary: Colors.teal.shade400,
              secondary: Colors.teal.shade400,
              inverseSurface: const Color(0xff232222),
              surfaceTint:  const Color(0xff121212),
              outlineVariant: Colors.white.withOpacity(0.2)),
          typography: Typography.material2021(
              white: Typography.whiteMountainView.copyWith(
                  titleLarge: Typography.whiteMountainView.titleLarge
                      ?.copyWith(fontSize: 20.0))),
          dividerTheme: const DividerThemeData(space: 1.0)),
      routes: {
        "/": (context) {
          return const TopHeadlinesPage();
        },
        SearchHeadlinesPage.route: (context) => const SearchHeadlinesPage()
      },
    );
  }
}
