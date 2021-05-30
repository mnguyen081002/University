import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_helper/models/university.dart';

import '../components/rating_info.dart';
import 'major_shortcut_detail.dart';

class ShortCutInfo extends StatelessWidget {
  const ShortCutInfo({
    Key? key,
    required this.dataUniversity,
    required this.isSearchByMajors,
  }) : super(key: key);

  final University dataUniversity;
  final bool isSearchByMajors;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 10),
      child: Container(
        height: size.height * 1 / 9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                dataUniversity.name,
                style: TextStyle(
                  fontFamily: 'Lora',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                softWrap: true,
              ),
            ),
            Spacer(),
            RatingInfo(),
            isSearchByMajors ? MajorShortcutDetail() : Text('25 ngành'),
          ],
        ),
      ),
    );
  }
}
