import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/global_widgets/search/search_appbar.dart';

import 'controllers/home_screen_controller.dart';

class HomeScreen extends GetView<HomeScreenController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
        title: SearchAppBar(hintText: 'Tìm trường'),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
