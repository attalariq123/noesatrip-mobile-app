import 'package:flutter/material.dart';

class DestinationImage extends StatelessWidget {
  const DestinationImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Container(
      height: _screenSize.height * 0.56,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/desa-adat-praijing.jpg'),
            fit: BoxFit.cover),
      ),
    );
  }
}
