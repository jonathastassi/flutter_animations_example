import 'package:corinthians_flutter_animations/widgets/loading_custom.dart';
import 'package:flutter/material.dart';

class ButtonAnimatedSubmit extends StatelessWidget {
  final String label;
  final VoidCallback? onClick;
  final bool isLoading;
  final AnimationController animationController;

  ButtonAnimatedSubmit(
      {required this.label,
      required this.onClick,
      this.isLoading = false,
      required this.animationController});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            minimumSize:
                Size(isLoading ? height * .085 : size.width, height * .085),
            shape: isLoading
                ? CircleBorder()
                : RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                  ),
          ),
          onPressed: () => !isLoading ? this.onClick?.call() : null,          
          child: isLoading
              ? LoadingCustom()
              : Text(
                  this.label,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: height * .036,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 0.3,
                  ),
                ),
        );
      },
    );
  }
}
