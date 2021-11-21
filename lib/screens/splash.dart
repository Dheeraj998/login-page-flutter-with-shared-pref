import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests1/main.dart';
import 'package:tests1/screens/home.dart';
import 'package:tests1/screens/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/Sxzd (2).png',
          height: 60,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (cntx) => LogIn()));
  }

  Future<void> checkUserLoggedIn(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedpref.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoLogin();
    } else {
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    }
  }
}
