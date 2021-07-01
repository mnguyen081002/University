import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/modules/home/components/custom_card.dart';
import 'package:university_helper/app/modules/suggest/controller/suggest_screen_controller.dart';

class ListContent extends StatelessWidget {
  const ListContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SuggestScreenController>();
    return Obx(() {
      return ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.height * 0.24),
        child: ListView.builder(
          padding: EdgeInsets.only(right: 10),
          scrollDirection: Axis.horizontal,
          itemCount: controller.suggestList_1.length,
          itemBuilder: (context, index) {
            return CustomCard(item: controller.suggestList_1[index]);
          },
        ),
      );
    });
  }
}
