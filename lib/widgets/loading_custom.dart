import 'package:flutter/material.dart';

class LoadingCustom extends StatelessWidget {
  final bool isDark;

  LoadingCustom({required this.isDark});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        isDark ? Colors.white : Colors.black,
      ),
    );
  }
}
