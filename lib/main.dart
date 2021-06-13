import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/global_widgets/search/search_shared_preferences.dart';
import 'app/modules/detail/detail_screen.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/theme/app_theme.dart';

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
      theme: appThemeData[AppTheme.Light],
      initialRoute: AppPages.INITIAL,
      routes: {
        DetailScreen.routeName: (context) => DetailScreen(),
      },
      getPages: AppPages.routes,
    );
  }
}
