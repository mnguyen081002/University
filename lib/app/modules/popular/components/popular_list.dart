import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/majors.dart';
import 'package:university_helper/app/modules/popular/controllers/popular_detail_controller.dart';
import 'package:university_helper/app/modules/search/components/card/university_card.dart';

import 'major_card.dart';

class PopularList extends GetView<PopularDetailController> {
  const PopularList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<PopularDetailController>(
        builder: (builder) {
          return Obx(
            () => ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: builder.list.length,
              itemBuilder: (context, index) {
                return builder.list[index] is MajorsF
                    ? MajorCard(
                        description: '',
                        title: builder.list[index].name,
                      )
                    : UniversityCard(
                        isSearchByMajors: true,
                        dataUniversity: builder.list[index],
                      );
              },
            ),
          );
        },
      ),
    );
  }
}
