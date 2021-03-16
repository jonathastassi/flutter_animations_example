import 'package:flutter/material.dart';

class AnimatedOpacityCustom extends StatelessWidget {
  final double opacity;
  final Widget child;

  AnimatedOpacityCustom({required this.opacity, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: Duration(
        milliseconds: 900,
      ),
      child: child,
    );
  }
}
