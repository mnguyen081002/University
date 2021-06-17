import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/modules/popular/controllers/popular_screen_controller.dart';

class PopularAppbar extends StatelessWidget {
  const PopularAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PopularScreenController>();
    return SliverAppBar(
      expandedHeight: 130,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          controller.urlAppbar,
          fit: BoxFit.cover,
        ),
        title: Text(controller.title),
        centerTitle: true,
      ),
    );
  }
}
