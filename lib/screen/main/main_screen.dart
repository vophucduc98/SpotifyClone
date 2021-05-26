import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/bloc/playlist_bloc.dart';
import 'package:spotify_clone/repository/playlist_repository.dart';
import 'package:spotify_clone/screen/main/component/main_menu.dart';
import 'package:spotify_clone/screen/main/component/play_bar.dart';
import 'package:spotify_clone/screen/main/component/side_bar.dart';

class MainScreen extends StatefulWidget {
  PlaylistRepostiory _playlistRepostiory = PlaylistRepostiory();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PlaylistBloc _playlistBloc;
  ScrollController scrollController = ScrollController();
  double opacityBar = 0.0;

  @override
  void initState() {
    _playlistBloc =
        PlaylistBloc(playlistRepostiory: widget._playlistRepostiory);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaylistBloc>(
      create: (BuildContext context) => _playlistBloc,
      child: Scaffold(
        body: Column(
          children: [
            Row(
              children: [SideBar(), MainMenu()],
            ),
            PlayBar(),
          ],
        ),
      ),
    );
  }
}
