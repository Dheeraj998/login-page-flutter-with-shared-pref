import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests1/screens/login.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
        actions: [
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text('home'),
        ),
      ),
    );
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => LogIn()), (route) => false);
  }
}
