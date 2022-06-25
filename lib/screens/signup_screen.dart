import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/component.dart';
import '../widgets/custom_textfield.dart';
import 'home_screen.dart';



class SignupScreen extends StatefulWidget {
  static String id = 'SignupScreen';
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late String _email, _password, _name,_phone;

  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  const Text(
                    'lets Sign you up,',
                    style: TextStyle(color: Colors.teal, fontSize: 32),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _name = value!;
                    },
                    hint: 'Enter your name',
                    icon: Icons.perm_identity,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _email = value!;
                    },
                    hint: 'Enter your email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      _password = value!;
                    },
                    hint: 'Enter your password',
                    icon: Icons.lock,
                  ),
                  SizedBox(
                    height: height * .05,
                  ),
                  CustomTextField(
                      onClick:(value){
                        _phone=value!;
                      },
                      icon:Icons.phone,
                      hint: 'Phone no',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultbutton(function: () {
                    Navigator.pushNamed(context, HomeScreen.id);
                  }, text: 'Sign up')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
