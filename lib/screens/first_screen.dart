import 'package:flutter/material.dart';
import 'package:userapp/screens/home_screen.dart';
import 'package:userapp/screens/login_screen.dart';

class FirstScreen extends StatelessWidget {
  static String id='FristScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Smart Shopping Cart'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.teal,
                size: 200,
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Container(
              width: 220,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, HomeScreen.id);

                },
                child: const Text(
                  'guest',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: 220,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginScreen.id);


                },
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ),
            ),
            Expanded(child: SizedBox())
          ],
        ),
      ),
    );
  }
}