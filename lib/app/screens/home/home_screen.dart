import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/screens/home/components/search/search_appbar.dart';
import 'package:university_helper/app/screens/home/controllers/home_controller.dart';
import 'package:university_helper/app/utils/constants.dart';

import 'components/list/list_university.dart';
import 'components/slider_bar.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeScreenController>(
        builder: (builder) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: SearchAppBar(hintText: 'Tìm trường'),
              bottom: TabBar(
                controller: builder.tabController,
                tabs: List.generate(4, (index) {
                  return Tab(
                    text: kSliderBarOptions[index],
                  );
                }),
              ),
            ),
            body: Stack(
              children: [
                TabBarView(
                  controller: builder.tabController,
                  children: List.generate(
                    4,
                    (index) => ListUniversity(),
                  ),
                ),
                Obx(
                  () => AnimatedPositioned(
                    top: builder.scrollPositionController.value,
                    duration: const Duration(milliseconds: 100),
                    child: SliderBar(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
