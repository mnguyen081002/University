import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/models/university.dart';
import 'package:university_helper/screens/home/components/shortcut_info.dart';
import 'package:university_helper/screens/home/components/tag_university.dart';
import 'package:university_helper/screens/info/info_screen.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key, required this.isSearchByMajors, required this.dataUniversity})
      : super(key: key);
  final University dataUniversity;
  final bool isSearchByMajors;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () {
          Get.toNamed(InfoScreen.routeName, arguments: dataUniversity.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: size.height * 1 / 8,
                    width: size.width * 1 / 4,
                    child: Image.network(
                      dataUniversity.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  InfoUniversity(
                    dataUniversity: dataUniversity,
                    isSearchByMajors: isSearchByMajors,
                  ),
                ],
              ),
              TagUniversity(),
            ],
          ),
        ),
      ),
    );
  }
}
