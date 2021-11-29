import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> buttons = ["Movies", "Shows", "Music"];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0 / 2),
      height: 36,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: buttons.length,
          itemBuilder: (context, index) => ButtonCard(button1: buttons[index])),
    );
  }
}

class ButtonCard extends StatelessWidget {
  final String button1;
  const ButtonCard({Key? key, required this.button1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 20.0/4),// top and bottom padding
      decoration: BoxDecoration(border: Border.all(color: Colors.red),borderRadius: BorderRadius.circular(6), color: Colors.red,),
      margin: EdgeInsets.only(left: 28),
      child: Text(button1, style: TextStyle(color: Color(0xFFFFFF).withOpacity(0.8),fontSize: 16),),
    );
  }
}
