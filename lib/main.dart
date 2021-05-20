import 'package:flutter/material.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/screen/main/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spotify Clone',
      theme: ThemeData(
        backgroundColor: backgroundColor,
        primaryColor: primaryColor,
        accentColor: accentColor,
        fontFamily: 'Circular',
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
      ),
      home: Scaffold(
        body: MainScreen(),
      ),
    );
  }
}
