import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/models/product.dart';
import 'package:userapp/screens/CartScreen.dart';

import '../constants.dart';
import '../provider/cartItem.dart';
import '../services/store.dart';

class ProductInfo extends StatefulWidget {
  static String id = 'ProductInfo';
  @override
  _ProductInfoState createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
  int _quantity = 1;
  final _store = Store();

  @override
  Widget build(BuildContext context) {
    String qrcode=ModalRoute.of(context)!.settings.arguments as String;

  return Scaffold(
    body: StreamBuilder<QuerySnapshot>(
      stream:_store.queryData(qrcode) ,
      builder: (context ,snapshot){
        if (!snapshot.hasData){ return Center(child: Text('Loading...'));
        } else {

            List<Product> products = [];
            for (var doc in snapshot.data!.docs) {
              var data = (doc.data() as Map<String, dynamic>);
              products.add(Product(

                pPrice: data[kProductPrice],
                pid: doc.id,
                pName: data[kProductName],
                pDescription: data[kProductDescription],
                pweight: data[kProductWeight],
                pCategory: data[kProductCategory],
                pimageLocation: data[kProductimageLoc],
                pexpirydate: data[kProductExpiryDate],

              ));
            }

            return Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage(products[0].pimageLocation),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * .1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios)),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, CartScreen.id);

                            },
                            child: Icon(Icons.shopping_cart))
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Column(
                    children: <Widget>[
                      Opacity(
                        child: Container(
                          color: Colors.white,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .3,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  products[0].pName,
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  products[0].pDescription,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w800),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '\$${products[0].pPrice}',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    ClipOval(
                                      child: Material(
                                        color: kMainColor,
                                        child: GestureDetector(
                                          onTap: add,
                                          child: SizedBox(
                                            child: Icon(Icons.add),
                                            height: 32,
                                            width: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      _quantity.toString(),
                                      style: TextStyle(fontSize: 60),
                                    ),
                                    ClipOval(
                                      child: Material(
                                        color: kMainColor,
                                        child: GestureDetector(
                                          onTap: subtract,
                                          child: SizedBox(
                                            child: Icon(Icons.remove),
                                            height: 32,
                                            width: 32,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        opacity: .5,
                      ),
                      ButtonTheme(
                        minWidth: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .08,
                        child: Builder(
                          builder: (context) => RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10))),
                            color: kMainColor,
                            onPressed: () {
                              addToCart(context, products[0]);

                            },
                            child: Text(
                              'Add to Cart'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );


          }



      },

    )
  );
  }
  subtract() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        print(_quantity);
      });
    }
  }

  add() {
    setState(() {
      _quantity++;
      print(_quantity);
    });
  }
  void addToCart(context, product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    product.pQuantity = _quantity;
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
      if (productInCart.pName == product.pName) {
        exist = true;
      }
    }
    if (exist) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('you\'ve added this item before'),
      ));
    } else {
      cartItem.addProduct(product);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Added to Cart'),
      ));
    }
  }


}