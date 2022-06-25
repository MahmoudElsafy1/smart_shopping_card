import 'package:flutter/cupertino.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);
  static String id='MapScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffffff),
      child: Image.network(
          'https://i.pinimg.com/originals/78/a1/65/78a165f3db1121f23fe4524f40da2608.png'),
    );
  }
}
