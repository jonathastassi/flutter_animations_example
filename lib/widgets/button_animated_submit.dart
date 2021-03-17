import 'package:corinthians_flutter_animations/utils/http_status_enum.dart';
import 'package:corinthians_flutter_animations/widgets/loading_custom.dart';
import 'package:flutter/material.dart';

class ButtonAnimatedSubmit extends StatelessWidget {
  final String label;
  final VoidCallback? onClick;
  final HttpStatus statusLoading;

  ButtonAnimatedSubmit(
      {required this.label,
      required this.onClick,
      this.statusLoading = HttpStatus.none});

  double getHeight(Size size) {
    if (statusLoading == HttpStatus.finalized) {
      return size.height;
    }

    return size.height * .085;
  }

  double getWidth(Size size) {
    if (statusLoading == HttpStatus.running) {
      return size.height * .085;
    }

    if (statusLoading == HttpStatus.finalized) {
      return size.width;
    }

    return size.width - 40;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          minimumSize: Size(
              statusLoading == HttpStatus.running ? height * .085 : size.width,
              height * .085),
          shape: statusLoading == HttpStatus.running
              ? CircleBorder()
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
        ),
        onPressed: () =>
            statusLoading != HttpStatus.running ? this.onClick?.call() : null,
        child: statusLoading == HttpStatus.running
            ? LoadingCustom(
                isDark: false,
              )
            : Text(
                this.label,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * .036,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.3,
                ),
              ),
      ),
    );
  }
}
