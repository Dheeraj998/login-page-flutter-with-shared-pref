import 'package:flutter/material.dart';

class Screen2 extends StatelessWidget {
  const Screen2({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sf'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('go back'),
        ),
      ),
    );
  }
}
