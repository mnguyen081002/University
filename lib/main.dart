import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/screens/detail/detail_screen.dart';
import 'package:university_helper/screens/home/home_screen.dart';

import 'providers/majors_provider.dart';
import 'providers/university_provider.dart';

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
        theme: ThemeData(
          primaryColor: Colors.orange[100],
          textTheme: TextTheme(
            bodyText1: TextStyle(fontSize: 14),
            bodyText2: TextStyle(fontWeight: FontWeight.w500),
          ),
          accentColor: Colors.black54,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          appBarTheme: AppBarTheme(
            color: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
        ),
        home: HomeScreen(),
        routes: {
          DetailScreen.routeName: (context) => DetailScreen(),
        },
      ),
    );
  }
}
