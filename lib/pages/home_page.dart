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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/escudo-Corinthians.png",
                width: height * .07),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("OLÁ"),
                Text(
                  "JONATHAS",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      letterSpacing: 2),
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  Icons.menu_rounded,
                  size: 40,
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
