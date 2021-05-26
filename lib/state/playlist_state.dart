import 'package:flutter/cupertino.dart';
import 'package:spotify_clone/models/playlist.dart';

abstract class PlaylistState {}

class PlaylistUninitializedState extends PlaylistState {}

class PlaylistFetchingState extends PlaylistState {}

class PlaylistFetchedState extends PlaylistState {
  final Playlist playlist;
  PlaylistFetchedState({@required this.playlist});
}

class PlaylistEmptyState extends PlaylistState {}

class PlaylistErrorState extends PlaylistState {}
