// ignore_for_file: unnecessary_new
import 'package:movie_app/pages/nointernet.dart';
import 'package:provider/provider.dart';

import 'connectivity.dart';
import 'package:flutter/material.dart';

import 'package:movie_app/connectivity.dart';
import 'pages/saved.dart';
import '/pages/home.dart';
import 'pages/favourite.dart';

class Bars extends StatefulWidget {
  const Bars({Key? key}) : super(key: key);

  @override
  _BarsState createState() => _BarsState();
}

class _BarsState extends State<Bars> {
  @override
  void initState() {
    super.initState();
    Provider.of<ConnectivyProvider>(context, listen: false).startMonitoring();
  }

  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final screens = [
    const Home(),
    const Saved(),
    const Favourite(),
  ];

  @override
  Widget build(BuildContext context) {
    return pageUI();
  }

  Widget pageUI() {
    return Consumer<ConnectivyProvider>(
        builder: (consumerContext, model, child) {
      if (model.isOnline != null) {
        return model.isOnline ?? false
            ? Scaffold(
                key: _scaffoldKey,
                endDrawer: Drawer(
                  child: ListView(
                    children: const [
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
              )
            : const NoInternet();
      }
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Image.asset(
              "assetss/dp.png",
              height: 46,
              width: 46,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text('Nihal Padwal'),
        ],
      ),
      actions: <Widget>[
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                const Text("Search"),
              ],
            ),
          ),
        ),
      ],
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.pink.shade800,
      unselectedItemColor: Colors.grey[600],
      showUnselectedLabels: false,
      currentIndex: currentIndex,
      onTap: (index) => setState(() {
        if (index == 3) {
          _scaffoldKey.currentState!.openEndDrawer(); // This is what I've tried
        } else {
          currentIndex = index;
        }
      }),
      items: const [
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
