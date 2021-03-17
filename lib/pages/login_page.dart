import 'package:corinthians_flutter_animations/pages/home_page.dart';
import 'package:corinthians_flutter_animations/utils/http_status_enum.dart';
import 'package:corinthians_flutter_animations/utils/validator.dart';
import 'package:corinthians_flutter_animations/widgets/animated_opacity_custom.dart';
import 'package:corinthians_flutter_animations/widgets/button_animated_submit.dart';
import 'package:corinthians_flutter_animations/widgets/input_form.dart';
import 'package:corinthians_flutter_animations/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static get route => MaterialPageRoute(
        builder: (context) => LoginPage(),
      );

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  double opacityHeader = 0;
  double opacityBody = 0;
  HttpStatus statusLoading = HttpStatus.none;

  late AnimationController _onFinalizeAnimationController;
  late Animation<double> _sizeBlackAnimation;
  late Animation<double> _opacityTitleAnimation;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _onFinalizeAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4))
          ..addStatusListener((status) {
            if (status == AnimationStatus.forward) {
              opacityBody = 0;
            }

            if (status == AnimationStatus.completed) {
              Navigator.of(context).pushReplacement(HomePage.route);
            }
          });

    _sizeBlackAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _onFinalizeAnimationController,
        curve: Interval(0.25, 0.55, curve: Curves.bounceOut),
      ),
    );
    _opacityTitleAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _onFinalizeAnimationController,
        curve: Interval(0.60, 0.80),
      ),
    )..addListener(() {
        opacityHeader = _opacityTitleAnimation.value;
      });

    showWidgets();
  }

  void showWidgets() async {
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      opacityHeader = 1;
      opacityBody = 1;
    });
  }

  void _pressEnter() async {
    var state = _formKey.currentState;
    if (state?.validate() == true) {
      FocusScope.of(context).unfocus();

      setState(() {
        statusLoading = HttpStatus.running;
      });

      await Future.delayed(Duration(seconds: 2));

      setState(() {
        statusLoading = HttpStatus.finalized;
      });

      _onFinalizeAnimationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return AnimatedBuilder(
      animation: _onFinalizeAnimationController,
      builder: (context, child) {
        return PageScaffold(
          header: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo-corinthians",
                  child: Image.asset("assets/images/escudo-Corinthians.png",
                      width: height * .15),
                ),
                Expanded(
                  child: AnimatedOpacityCustom(
                    opacity: opacityHeader,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("LOJA"),
                        Text(
                          "TODO PODEROSO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              letterSpacing: 2),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: height * .05),
            child: AnimatedOpacityCustom(
              opacity: opacityBody,
              child: Column(
                children: [
                  Text(
                    "Acessar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: height * .04,
                    ),
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  Text(
                    "Digite os seus dados de acesso.",
                    style: TextStyle(
                      fontSize: height * .025,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputForm(
                          hint: "Digite o e-mail",
                          validator: Validator.isEmpty,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        InputForm(
                          hint: "Digite a senha",
                          obscure: true,
                          validator: Validator.isEmpty,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        ButtonAnimatedSubmit(
                          label: "Entrar",
                          statusLoading: statusLoading,
                          onClick: _pressEnter,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          percenteBody: .65 * _sizeBlackAnimation.value,
        );
      },
    );
  }
}
