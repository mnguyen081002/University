import 'package:flutter/material.dart';
import 'package:university_helper/app/global_widgets/search/search_appbar.dart';
import 'package:university_helper/app/utils/size_config.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: SearchAppBar(hintText: 'Search'),
      ),
      body: Body(),
    );
  }
}
