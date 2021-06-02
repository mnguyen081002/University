import 'package:flutter/material.dart';

const fakeData = [
  'Công nghệ thông tin',
  'Khoa học máy tính',
  'Toán tin',
  'Trí tuệ nhân tạo'
];

class SliderBar extends StatelessWidget implements PreferredSize {
  const SliderBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.only(top: 5),
      width: size.width,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
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
                  fakeData[index],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        },
        itemCount: 4,
      ),
    );
  }

  @override
  Widget get child => SizedBox();

  @override
  Size get preferredSize => Size(0, 0);
}
