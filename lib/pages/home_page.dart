import 'package:corinthians_flutter_animations/widgets/drawer_menu.dart';
import 'package:corinthians_flutter_animations/widgets/page_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static get route => MaterialPageRoute(
        builder: (context) => HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return PageScaffold(
      key: _scaffoldKey,
      endDrawer: DrawerMenu(),
      header: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
              tag: "logo-corinthians",
              child: Image.asset("assets/images/escudo-Corinthians.png",
                  width: height * .07),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "OLÁ",
                  style: TextStyle(fontSize: height * .015),
                ),
                Text(
                  "JONATHAS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: height * .032,
                      letterSpacing: 2),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  size: height * .05,
                ),
                onPressed: () {
                  var state = this._scaffoldKey.currentState;
                  state?.openEndDrawer();
                })
          ],
        ),
      ),
      body: Center(child: Text("Menu Inicial")),
      percenteBody: 0.9,
    );
  }
}
