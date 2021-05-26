import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/event/playlist_event.dart';
import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/repository/playlist_repository.dart';
import 'package:spotify_clone/state/playlist_state.dart';

class PlaylistBloc extends Bloc<PlaylistEvent, PlaylistState> {
  final PlaylistRepostiory playlistRepostiory;
  PlaylistBloc({this.playlistRepostiory})
      : assert(playlistRepostiory != null),
        super(PlaylistUninitializedState());

  @override
  void onTransition(Transition<PlaylistEvent, PlaylistState> transition) {
    super.onTransition(transition);
  }

  PlaylistState get initialState => PlaylistUninitializedState();

  @override
  Stream<PlaylistState> mapEventToState(PlaylistEvent event) async* {
    yield PlaylistFetchingState();
    Playlist playlist;
    try {
      if (event is LoadEvent) {
        playlist =
            await playlistRepostiory.fetchSongByPlaylist(event.playlistId);
      }
      if (playlist == null) {
        yield PlaylistEmptyState();
      } else {
        yield PlaylistFetchedState(playlist: playlist);
      }
    } catch (_) {
      yield PlaylistErrorState();
    }
  }
}
