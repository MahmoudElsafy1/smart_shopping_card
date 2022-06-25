import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('assats/images/buyicon.png'),
            ),
            Positioned(
              bottom: 0,
              child: Text(
                'smart shopping cart',
                style: TextStyle(fontFamily: 'Pacifico', fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}