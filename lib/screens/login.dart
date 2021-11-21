import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tests1/main.dart';
import 'package:tests1/screens/home.dart';

class LogIn extends StatefulWidget {
  LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isDataMatched = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextFormField(
                  controller: _usernameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'value is empty';
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: !_isDataMatched,
                      child: Text(
                        'username and password doesnt match',
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('data empty');
                        }
                      },
                      icon: Icon(Icons.check),
                      label: Text('Login'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == _password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      print('match');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } else {
      // final _errorMessage = 'username and password doesnt match';
      // ScaffoldMessenger.of(context)
      //     .showSnackBar(SnackBar(content: Text(_errorMessage)));
      // //show dialog
      // showDialog(
      //   context: context,
      //   builder: (ctx) {
      //     return AlertDialog(
      //       title: Text('error'),
      //       content: Text(_errorMessage),
      //       actions: [
      //         TextButton(
      //             onPressed: () {
      //               Navigator.of(context).pop();
      //             },
      //             child: Text('close'))
      //       ],
      //     );
      //   },
      // );
      // setState(() {
      //   _isDataMatched = false;
      // });
      print('doesnt match');
    }
  }
}
