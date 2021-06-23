import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/modules/search/controllers/search_controller.dart';

import '../card/university_card.dart';

class ListUniversity extends GetView<SearchScreenController> {
  const ListUniversity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchScreenController>(builder: (_) {
      print(_.isLoading.value);

      return Obx(
        () {
          print(_.isLoading.value);
          return _.listUniversity.isEmpty
              ? Center(
                  child: _.isLoading.value
                      ? CircularProgressIndicator()
                      : Text('Đã có lỗi xảy ra  :('),
                )
              : Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ListView.builder(
                      controller: _.scrollController,
                      primary: false,
                      padding: EdgeInsets.fromLTRB(10, 50, 10, 40),
                      itemCount: _.listUniversity.length,
                      itemBuilder: (context, index) {
                        return UniversityCard(
                          dataUniversity: _.listUniversity[index],
                          isSearchByMajors: _.isSearchByMajors.value,
                        );
                      },
                    ),
                    if (_.isScrollLoading.value)
                      CircularProgressIndicator(strokeWidth: 1)
                  ],
                );
        },
      );
    });
  }
}
