import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/popular_appbar.dart';
import 'components/popular_list.dart';
import 'controllers/popular_screen_controller.dart';

class PopularScreen extends GetView<PopularScreenController> {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(PopularScreenController());
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          PopularAppbar(),
          PopularList(),
        ],
      ),
    );
  }
}
