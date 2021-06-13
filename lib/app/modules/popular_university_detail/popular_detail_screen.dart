import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/popular_appbar.dart';
import 'components/popular_list.dart';
import 'controllers/popular_detail_controller.dart';

class PopularDetail extends GetView<PopularDetailController> {
  const PopularDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
