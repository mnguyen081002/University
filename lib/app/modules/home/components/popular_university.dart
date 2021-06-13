import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/modules/home/components/university_card.dart';
import 'package:university_helper/app/modules/home/controllers/home_screen_controller.dart';
import 'package:university_helper/app/utils/size_config.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child:
              SectionTitle(title: "Các Trường được đánh giá cao", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        GetBuilder<HomeScreenController>(
          builder: (builder) {
            print(builder.listUniversity.length);
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...List.generate(
                    builder.listUniversity.length,
                    (index) {
                      return UniversityCard(
                          university: builder.listUniversity[index]);
                    },
                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
