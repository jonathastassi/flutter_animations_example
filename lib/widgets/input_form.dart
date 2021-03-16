import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String hint;
  final FormFieldValidator<String>? validator;
  final TextInputType type;
  final bool obscure;

  InputForm(
      {required this.hint,
      this.validator,
      this.type = TextInputType.text,
      this.obscure = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: size.height * .002),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: size.height * .004),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        labelText: hint,
        labelStyle: TextStyle(color: Colors.white, fontSize: size.height * .026),
        contentPadding: EdgeInsets.symmetric(vertical: size.height * .02, horizontal: size.height * .02),
      ),
      style: TextStyle(color: Colors.white, fontSize: size.height * .032),
      keyboardType: type,
      obscureText: obscure,
      validator: validator,
    );
  }
}
