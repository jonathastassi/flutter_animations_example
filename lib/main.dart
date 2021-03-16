import 'package:corinthians_flutter_animations/pages/loading_page.dart';
import 'package:corinthians_flutter_animations/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

void main() {
  timeDilation = 2;
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
      ),
      home: LoginPage(),
    );
  }
}
