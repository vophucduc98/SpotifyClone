import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/constants.dart';

class PlayBar extends StatefulWidget {
  @override
  _PlayBarState createState() => _PlayBarState();
}

class _PlayBarState extends State<PlayBar> {
  bool _shuffleSong = false;
  bool _isPlaying = false;
  int _repeatMode = 0;
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.1,
      width: size.width,
      color: primaryColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              child: Row(
                children: [
                  /*
                          *Current played song thumbnail.
                        */
                  Container(
                    height: size.height * 0.08,
                    width: size.height * 0.08,
                    child: Image.network(
                      kurtCobain,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.height * 0.03,
                  ),
                  /*
                    *Current played song info. 
                  */
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Smell like teen spirit',
                          style: TextStyle(
                              color: textColorSelected,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                        Text("Nirvana")
                      ],
                    ),
                  ),
                  /*
                    *Animated liked icon button.
                  */
                  AnimatedIconButton(
                      size: 20,
                      duration: const Duration(milliseconds: 200),
                      icons: const <AnimatedIconItem>[
                        AnimatedIconItem(
                            backgroundColor: primaryColor,
                            icon:
                                Icon(Icons.favorite_border, color: textColor)),
                        AnimatedIconItem(
                            backgroundColor: primaryColor,
                            icon: Icon(Icons.favorite, color: accentColor))
                      ]),
                ],
              ),
            ),

            /*
                    *Music player. 
                  */
            Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  /*
                          Controll
                        */
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*
                                Shuffle
                              */
                        IconButton(
                          icon: Icon(Icons.shuffle),
                          onPressed: () {
                            setState(() {
                              _shuffleSong = !_shuffleSong;
                            });
                          },
                          color: _shuffleSong == false
                              ? textColorAlt
                              : accentColor,
                        ),
                        /*
                                Previous
                              */
                        IconButton(
                          icon: Icon(Icons.skip_previous),
                          onPressed: () {},
                          color: textColorAlt,
                        ),
                        /*
                                Play/Pause
                              */
                        IconButton(
                          iconSize: 40,
                          icon: Icon(_isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_fill),
                          onPressed: () {
                            setState(() {
                              _isPlaying = !_isPlaying;
                            });
                          },
                          color: textColorSelected,
                        ),
                        /*
                                Next
                              */
                        IconButton(
                          icon: Icon(Icons.skip_next),
                          onPressed: () {},
                          color: textColorAlt,
                        ),
                        IconButton(
                          icon: Icon(_repeatMode == 2
                              ? Icons.repeat_one
                              : Icons.repeat),
                          onPressed: () {
                            switch (_repeatMode) {
                              case 0:
                                {
                                  setState(() {
                                    _repeatMode = 1;
                                  });
                                  break;
                                }
                              case 1:
                                {
                                  setState(() {
                                    _repeatMode = 2;
                                  });
                                  break;
                                }
                              case 2:
                                {
                                  setState(() {
                                    _repeatMode = 0;
                                  });
                                  break;
                                }
                              default:
                                {
                                  setState(() {
                                    _repeatMode = 0;
                                  });
                                  break;
                                }
                            }
                          },
                          color: _repeatMode == 0 ? textColorAlt : accentColor,
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 180),
                        child: Slider.adaptive(
                          activeColor: textColorAlt,
                          inactiveColor: textColorAlt,
                          value: _currentValue,
                          onChanged: (double value) {
                            _currentValue = value;
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.playlist_play),
                    onPressed: () {},
                    color: textColorAlt,
                  ),
                  IconButton(
                    icon: Icon(Icons.speaker_group),
                    onPressed: () {},
                    color: textColorAlt,
                  ),
                  IconButton(
                    icon: Icon(Icons.volume_up),
                    onPressed: () {},
                    color: textColorAlt,
                  ),
                  IconButton(
                    icon: Icon(Icons.open_in_full),
                    onPressed: () {},
                    color: textColorAlt,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
