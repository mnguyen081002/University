import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:university_helper/screens/info/detail_screen.dart';

import 'providers/dataMajorsProvider.dart';
import 'providers/dataUniversityProvider.dart';
import 'screens/main_screen.dart';

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
          create: (context) => DataMajorsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DataUniversityProvider(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
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
          canvasColor: Colors.white,
        ),
        home: MainScreen(),
        routes: {
          DetailScreen.routeName: (context) => DetailScreen(),
        },
      ),
    );
  }
}
