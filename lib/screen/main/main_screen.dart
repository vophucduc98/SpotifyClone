import 'package:flutter/material.dart';
import 'package:spotify_clone/screen/main/component/main_menu.dart';
import 'package:spotify_clone/screen/main/component/play_bar.dart';
import 'package:spotify_clone/screen/main/component/side_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  ScrollController scrollController = ScrollController();
  double opacityBar = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [SideBar(), MainMenu()],
          ),
          PlayBar()
        ],
      ),
    );
  }
}
