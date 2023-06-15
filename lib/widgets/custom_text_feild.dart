import 'package:flutter/material.dart';

class CustomTextFeild extends StatelessWidget {
  CustomTextFeild({this.hintText, this.onChange});
  String? hintText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data) {
        if (data!.isEmpty) {
          return 'feild is required';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.white,
        )),
      ),
    );
  }
}
