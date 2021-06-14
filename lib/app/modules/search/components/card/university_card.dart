import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/university.dart';
import 'package:university_helper/app/modules/detail/detail_screen.dart';

import 'components/shortcut_detail.dart';
import 'components/tag_university.dart';
import 'components/university_img.dart';

class UniversityCard extends StatelessWidget {
  const UniversityCard({
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
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: size.width,
        height: size.height / 3.5,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: CachedNetworkImage(
          imageUrl: dataUniversity.imageUrl,
          placeholder: (context, url) => Image.asset('assets/loading.gif'),
          errorWidget: (context, url, error) => Image.asset(
            'assets/noImage.jpg',
            fit: BoxFit.cover,
          ),
          imageBuilder: (context, imageProvider) {
            return Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UniversityImg(image: imageProvider),
                  ShortCutInfo(
                    university: dataUniversity,
                    isSearchByMajors: isSearchByMajors,
                  ),
                ],
              ),
              if (dataUniversity.isNationalUniversity) TagUniversity(),
            ]);
          },
        ),
      ),
    );
  }
}
