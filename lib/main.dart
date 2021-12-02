import 'package:flutter/material.dart';
import 'package:movie_app/connectivity.dart';
import 'package:provider/provider.dart';
import 'bars.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ConnectivyProvider(),
          child: const Bars(),
        )
      ],
      child:const MaterialApp(
        color: Colors.black,
        debugShowCheckedModeBanner: false,
        home: Bars(),
      ),
    );
  }
}
