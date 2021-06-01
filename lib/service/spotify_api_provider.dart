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
          'Bearer BQATVaBYCna-F-DDvhRVQq9bA39onMAQNEqiRmOhedHPNKcRmQJt4omPor1UmM4VTAzV-k8zzsoPPa1vVxN-NQcWJrQD7Bj0GFPDoI4xxG7MpyVr5Lwu1m7Enlu1FB5LpE1ZIeKrqdvoM4DDlBWiBvpkUZxAmnhHsK8w_0PE-cRmJiyyk5dOIa-SHYZFjzgQWtLU8-JWMj402nxdWOiPxGrT-HVPIUj51fNgsumz9valSnLqf18QBKUkr3RRYTWKKk_KwMd8w6w9TRbzrzlTALWC1jOdKnE6WMBLzxcroQEjmE5m'
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
