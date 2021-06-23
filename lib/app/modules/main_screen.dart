import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_helper/app/modules/main_screen_controller.dart';
import 'package:university_helper/app/modules/search/search_screen.dart';
import 'package:university_helper/app/utils/extension.dart';

import 'home/home_screen.dart';

class MainScreen extends GetView<MainScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return IndexedStack(
            index: controller.bottomNavIndex.value,
            children: [
              SearchScreen(),
              Screen2(),
              Screen3(),
              HomeScreen(),
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: controller.isActive.value ? Colors.black : Colors.grey,
        onPressed: () {
          controller.onPressFloatBtn();
        },
        child: Icon(controller.floatButtonIcon),
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Obx(() {
        return AnimatedBottomNavigationBar.builder(
          itemCount: controller.iconList.length,
          tabBuilder: (int index, bool isActive) {
            final color = isActive ? Colors.black : Colors.grey;
            final labelColor = isActive ? Colors.black : Colors.grey;
            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  controller.iconList[index],
                  size: 24,
                  color: color,
                ),
                Text(
                  controller.labelList[index],
                  style: TextStyle(color: labelColor),
                ),
                const SizedBox(height: 4),
              ],
            );
          },
          gapLocation: GapLocation.end,
          backgroundColor: HexColor.fromHex('#FFFFFF'),
          activeIndex: controller.bottomNavIndex.value,
          leftCornerRadius: 32,
          rightCornerRadius: 0,
          onTap: (index) {
            controller.onTapItemBottomBar(index);
          },
        );
      }),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('1'),
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('2'),
        ),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('3'),
        ),
      ),
    );
  }
}
