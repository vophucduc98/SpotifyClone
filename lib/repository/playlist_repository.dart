import 'package:spotify_clone/models/playlist.dart';
import 'package:spotify_clone/service/spotify_api_provider.dart';

class PlaylistRepostiory {
  ApiProvider _apiProvider = ApiProvider();

  Future<Playlist> fetchSongByPlaylist(String id) =>
      _apiProvider.fetchSongByPlaylistID(id);
}
