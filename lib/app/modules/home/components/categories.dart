import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "assets/icons/analysis.svg", "text": "Chọn trường thích hợp"},
      {"icon": "assets/icons/idea.svg", "text": "Bill"},
      {"icon": "assets/icons/save.svg", "text": "Game"},
      {"icon": "assets/icons/calculator.svg", "text": "Tính điểm tốt nghiệp"},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
          (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: press,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: SvgPicture.asset(
                icon,
                fit: BoxFit.contain,
                width: 30,
                height: 30,
              ),
            ),
            SizedBox(height: 5),
            Text(text, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}
