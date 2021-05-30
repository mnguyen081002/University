import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/models/university.dart';
import 'package:university_helper/screens/detail/detail_screen.dart';
import 'package:university_helper/screens/home/components/shortcut_detail.dart';
import 'package:university_helper/screens/home/components/tag_university.dart';
import 'package:university_helper/screens/home/components/university_img.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.isSearchByMajors,
    required this.dataUniversity,
  }) : super(key: key);
  final University dataUniversity;
  final bool isSearchByMajors;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          DetailScreen.routeName,
          arguments: dataUniversity.universityUrl,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: size.width,
        height: size.height / 3.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UniversityImg(
                dataUniversity: dataUniversity,
              ),
              ShortCutInfo(
                dataUniversity: dataUniversity,
                isSearchByMajors: isSearchByMajors,
              ),
            ],
          ),
          TagUniversity(),
        ]),
      ),
    );
  }
}
