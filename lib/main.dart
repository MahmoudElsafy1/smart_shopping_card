import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/provider/cartItem.dart';
import 'package:userapp/screens/CartScreen.dart';

import 'package:userapp/screens/first_screen.dart';
import 'package:userapp/screens/login_screen.dart';
import 'package:userapp/screens/map_screen.dart';
import 'package:userapp/screens/productInfo.dart';
import 'package:userapp/screens/signup_screen.dart';

import 'provider/modelHud.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ModelHud>(
            create: (context) => ModelHud(),
          ),
          ChangeNotifierProvider<CartItem>(
            create: (context) => CartItem(),
          ),

        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: FirstScreen.id,
          routes:
          {
            CartScreen.id: (context) => CartScreen(),
            FirstScreen.id:(context)=>FirstScreen(),
            HomeScreen.id:(context)=>HomeScreen(),
            LoginScreen.id:(context)=>LoginScreen(),
            SignupScreen.id:(context)=>SignupScreen(),
            MapScreen.id:(context)=>MapScreen(),
            ProductInfo.id: (context) => ProductInfo(),



          },
        ));
  }
}