import 'package:flutter/material.dart';

class TagUniversity extends StatelessWidget {
  const TagUniversity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 25,
      bottom: 10,
      child: Image.asset(
        'assets/logo/icon_dhqg.png',
        height: 55,
        fit: BoxFit.contain,
      ),
    );
  }
}
