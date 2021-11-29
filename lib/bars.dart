import 'package:flutter/material.dart';
import 'favourite.dart';
import 'home.dart';
import 'saved.dart';

class Bars extends StatefulWidget {
  const Bars({Key? key}) : super(key: key);

  @override
  _BarsState createState() => _BarsState();
}

class _BarsState extends State<Bars> {
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final screens = [
    Home(),
    Saved(),
    Favourite(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Text("")),
            ListTile(
              title: Text("Drawer"),
            )
          ],
        ),
      ),

      appBar: buildAppbar(),

      body: screens[currentIndex],

      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppbar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.black,
    title: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Image.asset(
            "assetss/dp.png",
            height: 46,
            width: 46,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text('Nihal Padwal'),
      ],
    ),
    actions: <Widget>[
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ],
  );
}

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() {
        if (index == 3) {
          _scaffoldKey.currentState!
              .openEndDrawer(); // This is what I've tried
        } else {
          currentIndex = index;
        }
      }),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Drawer',
        )
      ],
    );
  }
}




