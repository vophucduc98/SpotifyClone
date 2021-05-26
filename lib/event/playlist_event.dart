abstract class PlaylistEvent {}

class LoadEvent extends PlaylistEvent {
  final String playlistId;
  LoadEvent({this.playlistId}) : assert(playlistId != null);
}
