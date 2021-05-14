import 'package:flutter/material.dart';

class TagUniversity extends StatelessWidget {
  const TagUniversity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.red,
          ]),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(5),
          ),
        ),
        height: 20,
        width: 40,
        child: Text(
          'ĐHQG',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
