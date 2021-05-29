import 'package:flutter/material.dart';

class SliderBar extends StatelessWidget {
  const SliderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      width: size.width,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.orangeAccent[100],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
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
        itemCount: 8,
      ),
    );
  }
}
