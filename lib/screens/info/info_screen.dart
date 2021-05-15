import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/providers/dataUniversityProvider.dart';

class InfoScreen extends StatelessWidget {
  static const routeName = 'info-screen';
  const InfoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    final university =
        Provider.of<DataUniversityProvider>(context, listen: false).getById(id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 1 / 3,
                  width: size.width,
                  child: Image.network(university.imageUrl),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
