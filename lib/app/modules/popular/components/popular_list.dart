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
                          return builder.list[index] is MajorsF
                              ? MajorCard(
                                  description: '',
                                  title: builder.list[index].name,
                                  imageUrl: builder.list[index].imageUrl != ''
                                      ? builder.list[index].imageUrl
                                      : 'https://lh3.googleusercontent.com/proxy/MwuBAAJyxW3_iRblmsFvRfN0DncluDQX4rMlPJ3MYp3S9jQPp5vLuXHVSnTwjyf0tCseSuq09qOXuK6XRevRRUbFhObwlJp9GL4WA7VFFQ')
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
