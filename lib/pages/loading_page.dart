import 'package:corinthians_flutter_animations/pages/login_page.dart';
import 'package:corinthians_flutter_animations/widgets/animated_opacity_custom.dart';
import 'package:corinthians_flutter_animations/widgets/loading_custom.dart';
import 'package:corinthians_flutter_animations/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> logoAnimation;
  late Animation<double> bodyAnimation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              goToLogin();
            }
          });

    logoAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25),
      ),
    );

    bodyAnimation = Tween<double>(begin: 0, end: 0.35).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.25, 0.35),
      ),
    );

    _animationController.forward();
  }

  void goToLogin() async {
    Navigator.pushReplacement(context, LoginPage.route);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return PageScaffold(
          percenteBody: bodyAnimation.value,
          header: Opacity(
            opacity: logoAnimation.value,
            child: Hero(
              tag: "logo-corinthians",
              child: Center(
                child: Image.asset(
                  "assets/images/escudo-Corinthians.png",
                  width: (size.height * .35) * logoAnimation.value,
                  height: (size.height * .35) * logoAnimation.value,
                ),
              ),
            ),
          ),
          body: AnimatedOpacityCustom(
            opacity: bodyAnimation.value == .35 ? 1 : 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingCustom(),
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
          ),                  
        );
      },
    );
  }
}
