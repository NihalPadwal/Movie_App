import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'music.dart';

class Buttons extends StatefulWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  _ButtonsState createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  List<bool> isSelected1 = [false];
  List<bool> isSelected2 = [true];
  List<bool> isSelected3 = [false];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ToggleButtons(
          borderRadius: BorderRadius.circular(7),
          fillColor: Colors.pink.shade800,
          selectedColor: Colors.white,
          color: Colors.white,
          isSelected: isSelected1,
          onPressed: (int index) {
            setState(() {
              isSelected1[index] = true;
              isSelected2[index] = false;
              isSelected3[index] = false;
            });
          },
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 0,
              ),
              child: Text(
                "Shows",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        ToggleButtons(
          borderRadius: BorderRadius.circular(7),
          fillColor: Colors.pink.shade800,
          selectedColor: Colors.white,
          color: Colors.white,
          isSelected: isSelected2,
          onPressed: (int index) {
            setState(() {
              isSelected2[index] = true;
              isSelected1[index] = false;
              isSelected3[index] = false;
            });
          },
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Movies",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        ToggleButtons(
          borderRadius: BorderRadius.circular(7),
          fillColor: Colors.pink.shade800,
          selectedColor: Colors.white,
          color: Colors.white,
          isSelected: isSelected3,
          onPressed: (int index) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Music()));
            setState(() {
              isSelected3[index] = true;
              isSelected2[index] = false;
              isSelected1[index] = false;
            });
          },
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                "Music",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
