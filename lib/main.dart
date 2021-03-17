import 'package:corinthians_flutter_animations/pages/loading_page.dart';
import 'package:corinthians_flutter_animations/pages/login_page.dart';
import 'package:corinthians_flutter_animations/utils/route_transiction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 4;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.white),
        primaryColor: Colors.white,        
        pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CustomRouteTransictionBuilder(),
            TargetPlatform.android: CustomRouteTransictionBuilder(),
            TargetPlatform.macOS: CustomRouteTransictionBuilder(),
            TargetPlatform.windows: CustomRouteTransictionBuilder(),
          })
      ),
      home: LoadingPage(),
    );
  }
}
