import 'package:corinthians_flutter_animations/pages/home_page.dart';
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

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  double opacity = 0;
  bool isLoading = false;

  late AnimationController _animationController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4));

    _animationController.forward();

    showWidgets();
  }

  void showWidgets() async {
    await Future.delayed(Duration(milliseconds: 500));

    setState(() {
      opacity = 1;
    });
  }

  void _pressEnter() async {
    var state = _formKey.currentState;
    if (state?.validate() == true) {
      setState(() {
        isLoading = true;
      });

      await Future.delayed(Duration(seconds: 2));

      Navigator.of(context).pushReplacement(HomePage.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

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
                opacity: opacity,
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
          opacity: opacity,
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
                      height: height * .04,
                    ),
                    ButtonAnimatedSubmit(
                      label: "Entrar",
                      isLoading: isLoading,
                      animationController: _animationController,
                      onClick: _pressEnter,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      percenteBody: .65,
    );
  }
}
