import 'package:flutter/material.dart';
import 'package:spotify_clone/constants.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  String _selectedState = 'Disable';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: backgroundColor,
      height: size.height * 0.9,
      width: size.width * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Icon(
              Icons.more_horiz,
              color: textColor,
            ),
          ),
          buildSideButton(
              homeText,
              Icon(Icons.home,
                  color: _selectedState == homeText
                      ? textColorSelected
                      : textColor),
              null),
          buildSideButton(
              searchText,
              Icon(Icons.search,
                  color: _selectedState == searchText
                      ? textColorSelected
                      : textColor),
              null),
          buildSideButton(
              libraryText,
              Icon(Icons.library_music_outlined,
                  color: _selectedState == libraryText
                      ? textColorSelected
                      : textColor),
              null),
          Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              playistText,
              style: TextStyle(color: textColor),
            ),
          ),
          buildSideButton(
              create,
              null,
              Image.asset(
                "assets/images/icons8-plus.png",
                width: 35,
                height: 35,
              )),
          buildSideButton(
              like,
              null,
              Image.asset(
                "assets/images/icons8-heart.png",
                width: 35,
                height: 35,
              )),
        ],
      ),
    );
  }

  Container buildSideButton(String text, Icon iconData, Image iconImage) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary:
                    _selectedState == text ? textColorAlt : backgroundColor),
            onPressed: () {
              setState(() {
                _selectedState = text;
              });
            },
            child: Row(children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Row(
                    children: [
                      iconData == null ? iconImage : iconData,
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                            color: _selectedState == text
                                ? textColorSelected
                                : textColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }
}
