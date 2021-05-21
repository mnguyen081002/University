import 'package:flutter/material.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 45,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(6),
              ),
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Cong',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
