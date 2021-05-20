import 'package:flutter/material.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/screen/main/component/play_bar.dart';
import 'package:spotify_clone/screen/main/component/side_bar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              SideBar(),
              Container(
                height: size.height * 0.9,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.0, 1.0],
                      colors: [primaryColor, accentColor]),
                ),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverAppBar(
                      title: Text('Playlist #4'),
                      expandedHeight: 200,
                      floating: true,
                      pinned: true,
                      flexibleSpace: Stack(
                        children: <Widget>[Positioned.fill(child: Container())],
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Container(
                            color: index.isOdd ? Colors.white : Colors.black12,
                            height: 100.0,
                            child: Center(
                              child: Text('$index', textScaleFactor: 5),
                            ),
                          );
                        },
                        childCount: 20,
                      ),
                    ),
                  ],
                ),
                // child: Column(
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.all(15.0),
                //       child: Row(
                //         children: [
                //           Container(
                //             decoration: BoxDecoration(
                //                 color: primaryColor.withOpacity(0.9),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(20))),
                //             child: IconButton(
                //               icon: Icon(Icons.navigate_before_rounded),
                //               color: textColorSelected,
                //               onPressed: () {},
                //             ),
                //           ),
                //           SizedBox(
                //             width: 10,
                //           ),
                //           Container(
                //             decoration: BoxDecoration(
                //                 color: primaryColor.withOpacity(0.9),
                //                 borderRadius:
                //                     BorderRadius.all(Radius.circular(20))),
                //             child: IconButton(
                //               icon: Icon(Icons.navigate_next_rounded),
                //               color: textColorSelected,
                //               onPressed: () {},
                //             ),
                //           ),
                //         ],
                //       ),
                //     )
                //   ],
                // ),
              )
            ],
          ),
          PlayBar()
        ],
      ),
    );
  }
}
