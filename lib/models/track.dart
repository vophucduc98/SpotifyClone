import 'album.dart';
import 'artists.dart';
import 'external_ids.dart';
import 'track_external_urls.dart';

class Track {
  Album album;
  List<Artists> artists;
  int discNumber;
  int durationMs;
  bool episode;
  bool explicit;
  ExternalIds externalIds;
  ExternalUrls externalUrls;
  String href;
  String id;
  bool isLocal;
  bool isPlayable;
  String name;
  int popularity;
  String previewUrl;
  bool track;
  int trackNumber;
  String type;
  String uri;

  Track({
    this.album,
    this.artists,
    this.discNumber,
    this.durationMs,
    this.episode,
    this.explicit,
    this.externalIds,
    this.externalUrls,
    this.href,
    this.id,
    this.isLocal,
    this.isPlayable,
    this.name,
    this.popularity,
    this.previewUrl,
    this.track,
    this.trackNumber,
    this.type,
    this.uri,
  });

  factory Track.fromJson(Map<String, dynamic> json) {
    return Track(
      album: json['album'] == null
          ? null
          : Album.fromJson(json['album'] as Map<String, dynamic>),
      artists: (json['artists'] as List<dynamic>)
          ?.map((e) =>
              e == null ? null : Artists.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      discNumber: json['disc_number'] as int,
      durationMs: json['duration_ms'] as int,
      episode: json['episode'] as bool,
      explicit: json['explicit'] as bool,
      externalIds: json['external_ids'] == null
          ? null
          : ExternalIds.fromJson(json['external_ids'] as Map<String, dynamic>),
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      isLocal: json['is_local'] as bool,
      isPlayable: json['is_playable'] as bool,
      name: json['name'] as String,
      popularity: json['popularity'] as int,
      previewUrl: json['preview_url'] as String,
      track: json['track'] as bool,
      trackNumber: json['track_number'] as int,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'album': album?.toJson(),
      'artists': artists?.map((e) => e?.toJson())?.toList(),
      'disc_number': discNumber,
      'duration_ms': durationMs,
      'episode': episode,
      'explicit': explicit,
      'external_ids': externalIds?.toJson(),
      'external_urls': externalUrls?.toJson(),
      'href': href,
      'id': id,
      'is_local': isLocal,
      'is_playable': isPlayable,
      'name': name,
      'popularity': popularity,
      'preview_url': previewUrl,
      'track': track,
      'track_number': trackNumber,
      'type': type,
      'uri': uri,
    };
  }
}
