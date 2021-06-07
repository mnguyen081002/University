import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:university_helper/app/screens/search/search_shared_preferences.dart';

import 'app/routes/app_pages.dart';
import 'app/screens/detail/detail_screen.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SearchSharedPreferences.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Choice University',
      theme: appThemeData[AppTheme.BlueLight],
      initialRoute: AppPages.INITIAL,
      routes: {
        DetailScreen.routeName: (context) => DetailScreen(),
      },
      getPages: AppPages.routes,
    );
  }
}
