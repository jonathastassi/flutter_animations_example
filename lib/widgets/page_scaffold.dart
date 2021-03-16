import 'package:flutter/material.dart';

class PageScaffold extends StatelessWidget {
  final Key? scaffoldKey;
  final Widget header;
  final Widget body;
  final Widget? endDrawer;
  final double percenteBody;

  PageScaffold(
      {required this.header,
      required this.body,
      this.percenteBody = 0.85,
      this.scaffoldKey,
      this.endDrawer});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final availableHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        endDrawer: endDrawer,
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: size.width,
                height: availableHeight * (1 - this.percenteBody) + 50,
                padding: EdgeInsets.only(bottom: 50),
                color: Colors.white,
                child: header,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.black,
                ),
                height: (availableHeight * this.percenteBody),
                width: size.width,
                child: body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
