import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/constants.dart';
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
                decoration: BoxDecoration(color: textColorAlt),
                child: NotificationListener(
                  child: CustomScrollView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: <Widget>[
                      SliverAppBar(
                        title: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                children: [
                                  /*
                                    Arrow Back
                                  */
                                  Container(
                                    decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.8),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: IconButton(
                                      icon: Icon(Icons.navigate_before_rounded),
                                      color: textColorSelected,
                                      onPressed: () {},
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  /*
                                    Arrow Forward
                                  */
                                  Container(
                                      decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: IconButton(
                                        icon: Icon(Icons.navigate_next_rounded),
                                        color: textColorSelected,
                                        onPressed: () {},
                                      )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  /*
                                    Arrow Play
                                  */
                                  AnimatedOpacity(
                                    duration: Duration(milliseconds: 200),
                                    opacity: opacityBar,
                                    child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                            color: accentColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(25))),
                                        child: IconButton(
                                          icon: Icon(Icons.play_arrow),
                                          color: textColorSelected,
                                          onPressed: () {},
                                        )),
                                  ),
                                  /*
                                    Album Name 
                                  */
                                  SizedBox(
                                    width: 20,
                                  ),
                                  AnimatedOpacity(
                                    opacity: opacityBar,
                                    duration: Duration(milliseconds: 200),
                                    child: Text(
                                      'Electronic/Rock',
                                      style: TextStyle(
                                          color: textColorSelected,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  /*
                                    Avatar
                                  */
                                  Expanded(
                                    flex: 1,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        height: 40,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.8),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            SizedBox(
                                              child: SvgPicture.asset(
                                                'assets/icons/avatar.svg',
                                                height: 32,
                                                width: 32,
                                              ),
                                            ),
                                            Text(
                                              'John Doe',
                                              style: TextStyle(
                                                  color: textColorSelected,
                                                  fontSize: 13),
                                            ),
                                            Icon(Icons.arrow_drop_down)
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        expandedHeight: 50,
                        floating: true,
                        pinned: true,
                        snap: true,
                        elevation: 0.0,
                        backgroundColor: textColorAlt.withOpacity(opacityBar),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          width: size.width,
                          height: size.height * 0.3,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [textColorAlt, primaryColor])),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Container(
                                width: 200,
                                height: 200,
                                child: Image.network(
                                  kurtCobain,
                                  fit: BoxFit.cover,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                                decoration: BoxDecoration(boxShadow: [
                                  BoxShadow(
                                      blurRadius: 30,
                                      color: Colors.black,
                                      offset: Offset(0, 10))
                                ]),
                              ),
                              SizedBox(width: 30),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 200,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'PLAYLIST',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: textColorSelected),
                                      ),
                                      Text(
                                        'Electronic/Rock',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: textColorSelected,
                                            fontSize: 50),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'RIP AND TEAR !!!',
                                        style: TextStyle(color: textColor),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(
                                            child: SvgPicture.asset(
                                              'assets/icons/avatar.svg',
                                              height: 16,
                                              width: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            'Võ Phúc Đức',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: textColorSelected,
                                                fontSize: 12),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.fiber_manual_record,
                                            color: textColor,
                                            size: 8,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '21 songs, 1 hr 32 min',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: textColor,
                                                fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              color:
                                  // index.isOdd ? Colors.white : Colors.black12,
                                  primaryColor,
                              height: 50.0,
                              child: Center(
                                child: Text('$index', textScaleFactor: 2),
                              ),
                            );
                          },
                          childCount: 20,
                        ),
                      ),
                    ],
                  ),
                  onNotification: (notificationInfo) {
                    if (notificationInfo is ScrollStartNotification) {
                      if (notificationInfo.metrics.pixels >
                          (size.height * 0.3)) {
                        setState(() {
                          opacityBar = 1.0;
                        });
                      } else {
                        setState(() {
                          opacityBar = 0.0;
                        });
                      }
                    }
                    return true;
                  },
                ),
              )
            ],
          ),
          PlayBar()
        ],
      ),
    );
  }
}
