import 'dart:convert';

import 'package:spotify_clone/models/playlist.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  String baseURL = 'https://api.spotify.com/v1/playlists';
  final successCode = 200;
  String error;
  Future<Playlist> fetchSongByPlaylistID(String id) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer BQAhcQRxKIdPd4Yt90VKA-SsKQ3gRGeR3Y6eB6W2Ur2zd4z6TCbLEDPq-ARES2uWl_238AVWyiKzO95GTJLvDLA7v1vaBrH-a9p7FffdekTmMnLh_75VePo85omqyNJeJ7hAjhS1VYynAf7ZptYaAVtxlLi-sEIt20w96ehG1I2izRrBjg5g8MmKe7mS-sLR1sKxpB4wcCYK9r1npV0Y2Hmps_RTq1rIYqTeByEXj-khLK8Noy_mQfTEZhjS1SSupzyxKx5i8vRL29JsG-Jz4AX1LChKQn3wmRCrbsPpINwXSu5Y'
    };
    final response = await http
        .get(baseURL + id + '?market=ES', headers: requestHeaders)
        .onError((error, stackTrace) => error = error);
    return parseResponse(response);
  }

  Playlist parseResponse(http.Response response) {
    final responseString = jsonDecode(response.body);
    if (response.statusCode == successCode) {
      return Playlist.fromJson(responseString);
    } else {
      throw Exception('Failed to load data.');
    }
  }
}
