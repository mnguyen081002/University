import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'app/providers/majors_provider.dart';
import 'app/providers/university_provider.dart';
import 'app/routes/app_pages.dart';
import 'app/screens/detail/detail_screen.dart';
import 'app/screens/home/home_screen.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MajorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UniversityProvider(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Choice University',
        theme: appThemeData[AppTheme.OrangeLight],
        initialRoute: AppPages.INITIAL,
        routes: {
          DetailScreen.routeName: (context) => DetailScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
        getPages: AppPages.routes,
      ),
    );
  }
}
