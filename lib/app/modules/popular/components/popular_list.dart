import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/modules/popular/controllers/popular_detail_controller.dart';

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
          final listMajor = builder.list;
          return ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return MajorCard(
                description: listMajor[index].description,
                title: listMajor[index].name,
              );
            },
          );
        },
      ),
    );
  }
}
