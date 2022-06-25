import 'package:flutter/material.dart';

Widget defaultbutton({
  double width = double.infinity,
  Color background = Colors.teal,
  required VoidCallback function,
  required String text,
  bool isUpperCase = true,
  double radiusSize = 10,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusSize), color: background),
      child: MaterialButton(
          onPressed: function,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              isUpperCase ? text.toUpperCase() : text,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          )),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String validateMess,
  required String labeltext,
  required IconData preficon,
  VoidCallback? function,
  VoidCallback? ontap,
  Function(String)? onChange,
  bool ob = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textInputType,
      onFieldSubmitted: (value) {},
      onTap: ontap,
      onChanged: onChange,
      obscureText: ob,
      validator: (value) {
        if (value!.isEmpty) {
          return validateMess;
        }
        return null;
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        label: Text(labeltext),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: Icon(
          preficon,
          color: Colors.teal,
        ),
      ),
    );
void navigateMethod(context, state) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => state,
      ),
    );
Widget SugBox({required String imageUrl}) => Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            height: 130,
            width: 180,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const Center(
            child: Text(
              'Iphone 13 Pro Max',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Text(
            'price 13,000 EGP',
            style: TextStyle(color: Colors.grey[100], fontSize: 18),
          )
        ],
      ),
    );
Widget catBox() => Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.teal, borderRadius: BorderRadius.circular(10)),
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
    );
