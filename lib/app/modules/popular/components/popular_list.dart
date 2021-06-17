import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/data/models/majors.dart';
import 'package:university_helper/app/modules/popular/controllers/popular_screen_controller.dart';
import 'package:university_helper/app/modules/popular_detail/popular_detail_screen.dart';
import 'package:university_helper/app/modules/search/components/card/university_card.dart';

import 'major_card.dart';

class PopularList extends GetView<PopularScreenController> {
  const PopularList({
    Key? key,
  }) : super(key: key);
  void toNewScreen(item) {
    Get.to(
      PopularDetailScreen(),
      arguments: {
        'imageUrl': item.imageUrl,
        'name': item.name,
        'linkRoot': item.linkRoot,
        'codeHtml': item.codeHtml,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: GetBuilder<PopularScreenController>(
        builder: (builder) {
          return Obx(
            () => builder.list.isEmpty
                ? Center(
                    child: builder.isLoading.value
                        ? CircularProgressIndicator()
                        : Text('Có lỗi xảy ra :('),
                  )
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      if (builder.isLoadMore.value) CircularProgressIndicator(),
                      ListView.builder(
                        controller: builder.scrollCtl,
                        primary: false,
                        shrinkWrap: true,
                        itemCount: builder.list.length,
                        itemBuilder: (context, index) {
                          return builder.list[index] is Majors
                              ? MajorCard(
                                  description: builder.list[index].description,
                                  title: builder.list[index].name,
                                  imageUrl: builder.list[index].imageUrl,
                                  onTap: () => toNewScreen(builder.list[index]),
                                )
                              : UniversityCard(
                                  isSearchByMajors: true,
                                  dataUniversity: builder.list[index],
                                );
                        },
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
