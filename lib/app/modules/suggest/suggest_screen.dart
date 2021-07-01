import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/global_widgets/search/search_appbar.dart';

import 'components/list_content.dart';
import 'components/topic.dart';
import 'controller/suggest_screen_controller.dart';

class SuggestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuggestScreenController>(
      init: SuggestScreenController(),
      builder: (controller) {
        return DefaultTabController(
          length: 4,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  forceElevated: true,
                  shadowColor: Colors.grey,
                  pinned: true,
                  floating: true,
                  toolbarHeight: 75,
                  title: SearchAppBar(hintText: 'Tìm trường'),
                  bottom: TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Cho bạn'),
                      Tab(text: 'Xếp hạng'),
                      Tab(text: 'ĐHQG'),
                      Tab(text: 'Yêu Thích'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                ...List.generate(
                  4,
                  (index) => ListView.builder(
                    addRepaintBoundaries: false,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Topic(
                              topic: 'Các trường đại học được yêu thích nhất'),
                          ListContent(),
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
