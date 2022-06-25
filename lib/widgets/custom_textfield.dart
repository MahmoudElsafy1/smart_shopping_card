import 'package:flutter/material.dart';
import 'package:userapp/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final FormFieldSetter<String>?  onClick;

  String?   _errorMessage(String str) {
    switch (hint) {
      case 'Enter your name':
        return 'Name is empty !';
      case 'Enter your email':
        return 'Email is empty !';
      case 'Enter your password':
        return 'Password is empty !';
    }
  }

  CustomTextField(
      {required this.onClick, required this.icon, required this.hint});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: TextFormField(

        validator: (value) {
          if (value!.isEmpty) {
            return _errorMessage(hint);
            // ignore: missing_return
          }
        },
        onSaved: onClick,
        obscureText: hint == 'Enter your password' ? true : false,
        cursorColor: kMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: Colors.teal,
          ),
          filled: true,

          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.teal)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.teal)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.teal)),
        ),
      ),
    );
  }
}