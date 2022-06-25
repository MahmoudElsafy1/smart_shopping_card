import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:userapp/screens/map_screen.dart';
import 'package:userapp/screens/productInfo.dart';

import '../services/store.dart';
import '../widgets/component.dart';


class HomeScreen extends StatefulWidget {
  static String id='HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String qrCode = 'Unknown';
  final _store = Store();

  var images = [
    'https://i0.wp.com/zeevector.com/wp-content/uploads/Special-Offer-Vector-Free-Download.png?fit=787%2C540&ssl=1'
        'https://ing.org/wp-content/uploads/2021/09/Calendar_Ramadan-1.png',
    'https://see.news/wp-content/uploads/2022/03/ornamental-arabic-lanterns-with-burning-candles-royalty-free-image-1646329984.jpg',
    'https://islamonline.net/wp-content/uploads/2022/03/ornament-lantern-in-a-moonlight--489x275.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
             IconButton(
                  icon: const Icon(Icons.qr_code),
                  onPressed:(){
                   scanQRCode();
                    Navigator.pushNamed(context, ProductInfo.id,
                        arguments: qrCode);



                    },


            ),
            IconButton(
              icon: const Icon(Icons.scale),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: double.infinity,
                  child: Image.network(
                    images[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                reverse: true,
                height: 250,
                viewportFraction: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MapScreen.id);
                    },
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: const [
                        Icon(
                          Icons.map,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Map',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(children: const [
                        Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 50,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'My Cart',
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        )
                      ]),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             Text('Suggestion',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.grey,
                )),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 300,
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => SugBox(imageUrl: images[0]),
                separatorBuilder: (context, index) => const SizedBox(width: 5),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              ),
            )
          ],
        ));

  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;

      });

    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}

