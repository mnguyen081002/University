import 'package:flutter/material.dart';

class TagUniversity extends StatelessWidget {
  const TagUniversity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      bottom: -10,
      child: Image.asset(
        'assets/logo/icon_dhqg.png',
        height: 35,
        fit: BoxFit.contain,
      ),
    );
  }
}
// Container(
// alignment: Alignment.center,
// decoration: BoxDecoration(
// gradient: LinearGradient(colors: [
// Colors.green.shade200,
// Colors.yellow.shade100,
// Colors.red.shade200,
// ]),
// borderRadius: BorderRadius.only(
// bottomRight: Radius.circular(5),
// ),
// ),
// height: 20,
// width: 40,
// child: Text(
// 'ĐHQG',
// style: TextStyle(
// fontSize: 12,
// fontWeight: FontWeight.bold,
// color: Colors.grey[600],
// ),
// ),
// ),
