import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/popular_detail_controller.dart';

class PopularDetail extends GetView<PopularDetailController> {
  const PopularDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Popular Detail'),
      ),
    );
  }
}
