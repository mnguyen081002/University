import 'package:flutter/material.dart';

const fakeData = [
  'Công nghệ thông tin',
  'Khoa học máy tính',
  'Toán tin',
  'Trí tuệ nhân tạo'
];

class SliderBar extends StatelessWidget {
  const SliderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('SliderBar Build');
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.only(top: 5),
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: const Radius.circular(30),
          bottomRight: const Radius.circular(30),
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
                  fakeData[index],
                  style: const TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }
}
