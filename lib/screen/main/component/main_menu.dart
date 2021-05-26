import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/bloc/playlist_bloc.dart';
import 'package:spotify_clone/constants.dart';
import 'package:spotify_clone/event/playlist_event.dart';
import 'package:spotify_clone/screen/main/component/playlist_song.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  ScrollController scrollController = ScrollController();
  double opacityBar = 0.0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PlaylistBloc>(context)
        .add(LoadEvent(playlistId: '/7fjgLUIE1E2JzCDbHCmnAh'));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
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
                          duration: Duration(milliseconds: 400),
                          opacity: opacityBar,
                          child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                  color: accentColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
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
                          duration: Duration(milliseconds: 400),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                        color: textColorSelected, fontSize: 13),
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
              backgroundColor: Colors.grey[850].withOpacity(opacityBar),
            ),
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [textColorAlt, primaryColor])),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Row(
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
                                              loadingProgress.expectedTotalBytes
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: size.width,
                          height: size.height * 0.15,
                          color: primaryColor.withOpacity(0.5),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              children: [
                                Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        color: accentColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35))),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.play_arrow,
                                        size: 35,
                                      ),
                                      color: textColorSelected,
                                      onPressed: () {},
                                    )),
                                SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.download,
                                    size: 25,
                                  ),
                                  color: textColor,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.more_horiz,
                                      size: 25,
                                    ),
                                    color: textColor),
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.search,
                                            size: 20,
                                          ),
                                          color: textColor),
                                      SizedBox(width: 20),
                                      Text(
                                        'Custom order',
                                        style: TextStyle(
                                            color: textColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                            size: 25,
                                            color: textColor,
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            PlaylistSong()
          ],
        ),
        onNotification: (notificationInfo) {
          if (notificationInfo is ScrollStartNotification) {
            if (notificationInfo.metrics.pixels > (size.height * 0.40)) {
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
    );
  }
}
