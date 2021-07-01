import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/search_controller.dart';

class SearchScreen extends GetView<SearchScreenController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<SearchScreenController>(
        builder: (builder) {
          return Container();
        },
      ),
    );
  }
}
