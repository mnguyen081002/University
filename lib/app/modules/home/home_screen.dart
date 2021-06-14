import 'package:flutter/material.dart';
import 'package:university_helper/app/global_widgets/search/search_appbar.dart';
import 'package:university_helper/app/utils/size_config.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/popular_university.dart';
import 'components/special_university.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchAppBar(hintText: 'Search'),
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
