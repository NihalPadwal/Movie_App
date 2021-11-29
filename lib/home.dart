import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'button.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Buttons(),
          
        ],
      ),
    );
  }
}

