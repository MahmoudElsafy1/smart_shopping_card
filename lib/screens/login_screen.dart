import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/screens/signup_screen.dart';


import '../widgets/component.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/cutsom_logo.dart';
import 'home_screen.dart';



class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  late String _email ;
  late String password;

  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
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
                    'Welcome to Our Store',
                    style: TextStyle(color: Colors.teal, fontSize: 32),
                  ),
                  const SizedBox(
                    height: 30,
                  ),



                  CustomTextField(
                    onClick: (value) {
                      _email = value!;
                    },
                    hint: 'Enter your email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onClick: (value) {
                      password = value!;
                    },
                    hint: 'Enter your password',
                    icon: Icons.lock,
                  ),



                  const SizedBox(
                    height: 30,
                  ),
                  defaultbutton(
                      function: () {
                        Navigator.pushNamed(context, HomeScreen.id);
                      },
                      text: 'Sign in'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don\'t have an accont?",
                        style: TextStyle( fontSize: 16),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, SignupScreen.id);
                          },
                          child: Text(
                            'sign up',
                            style: TextStyle(fontSize: 16),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
