import 'package:flutter/material.dart';

class ButtonSubmit extends StatelessWidget {
  final String label;
  final VoidCallback? onClick;
  final bool isLoading;

  ButtonSubmit(
      {required this.label, required this.onClick, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        minimumSize: Size(size.width, height * .085),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
      onPressed: this.onClick,
      child: Text(
        this.label,
        style: TextStyle(
          color: Colors.black,
          fontSize: height * .036,
          fontWeight: FontWeight.w300,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
