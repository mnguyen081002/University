import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/global_widgets/search/search_appbar.dart';
import 'package:university_helper/app/modules/home/controllers/home_screen_controller.dart';
import 'package:university_helper/app/utils/size_config.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/popular_university.dart';
import 'components/special_topic.dart';

class HomeScreen extends GetView<HomeScreenController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SearchAppBar(hintText: 'Tìm trường'),
            ),
            SizedBox(height: 10),
            DiscountBanner(),
            SizedBox(height: 20),
            Categories(),
            SizedBox(height: 20),
            SpecialOffers(),
            SizedBox(height: 20),
            PopularProducts(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
