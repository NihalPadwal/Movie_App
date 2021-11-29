import 'package:flutter/material.dart';

class Saved extends StatelessWidget {
  const Saved({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text("Saved",style: TextStyle(
    color: Colors.white,
  ),),),
    );
  }
}