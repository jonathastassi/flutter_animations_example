import 'dart:async';

import 'package:corinthians_flutter_animations/pages/login_page.dart';
import 'package:corinthians_flutter_animations/widgets/loading_custom.dart';
import 'package:corinthians_flutter_animations/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();

    goToLogin();
  }

  void goToLogin() async {
    await Future.delayed(Duration(seconds: 5));

    Navigator.pushReplacement(context, LoginPage.route);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return PageScaffold(
      percenteBody: .35,
      header: Center(
        child: Image.asset(
          "assets/images/escudo-Corinthians.png",
          width: (size.height * .35),
          height: (size.height * .35),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingCustom(
                isDark: true,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Aguarde...",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
