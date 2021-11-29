import 'package:flutter/material.dart';

class Favourite extends StatelessWidget {
  const Favourite({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Text("Favourite",style: TextStyle(
    color: Colors.white,
  ),),),
    );
  }
}