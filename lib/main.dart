import 'package:flutter/material.dart';
import 'package:tests1/screens/login.dart';

import 'package:tests1/screens/splash.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashScreen(),
      // routes: {
      //   'test1': (cntx) => Screen1(),
      //   'screen2': (cntx) => Screen2(),
      // },
    );
  }
}
