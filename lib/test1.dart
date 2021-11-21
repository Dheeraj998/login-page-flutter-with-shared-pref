// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:tests1/screen2.dart';

// class Screen1 extends StatelessWidget {
//   Screen1({Key? key}) : super(key: key);
//   final _textController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     getSavedData(context);
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           TextFormField(controller: _textController),
//           ElevatedButton(
//             onPressed: () {
//               saveDataToStorage();
//             },
//             child: Text('save value'),
//           ),
//         ],
//       )),
//     );
//   }

//   Future<void> saveDataToStorage() async {
//     print(_textController.text);
//     final sharedPrefs = await SharedPreferences.getInstance();
//     sharedPrefs.setString('save_value', _textController.text);
//   }
// }

// Future<void> getSavedData(BuildContext context) async {
//   final sharedPrefs = await SharedPreferences.getInstance();
//   final savedValue = sharedPrefs.getString('save_value');
//   if (savedValue != null) {
//     Navigator.of(context).push(MaterialPageRoute(builder: (cntx) {
//       return Screen2();
//     }));
//   }
// }
