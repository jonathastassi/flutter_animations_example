import 'package:corinthians_flutter_animations/pages/home_page.dart';
import 'package:corinthians_flutter_animations/utils/validator.dart';
import 'package:corinthians_flutter_animations/widgets/button_submit.dart';
import 'package:corinthians_flutter_animations/widgets/input_form.dart';
import 'package:corinthians_flutter_animations/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static get route => MaterialPageRoute(
        builder: (context) => LoginPage(),
      );

  final _formKey = GlobalKey<FormState>();

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
            Image.asset("assets/images/escudo-Corinthians.png",
                width: height * .15),
            Expanded(
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
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: height * .05),
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
                  ButtonSubmit(
                    label: "Entrar",
                    onClick: () {
                      Navigator.of(context).pushReplacement(HomePage.route);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      percenteBody: .65,
    );
  }
}
