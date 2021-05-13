import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: MaterialApp(
        theme: ThemeData(
          canvasColor: Colors.white,
        ),
        home: MainScreen(),
      ),
    );
  }
}
