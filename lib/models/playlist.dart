import 'external_urls.dart';
import 'followers.dart';
import 'images.dart';
import 'owner.dart';
import 'tracks.dart';

class Playlist {
  bool collaborative;
  String description;
  ExternalUrls externalUrls;
  Followers followers;
  String href;
  String id;
  List<Images> images;
  String name;
  Owner owner;
  dynamic primaryColor;
  bool public;
  String snapshotId;
  Tracks tracks;
  String type;
  String uri;

  Playlist({
    this.collaborative,
    this.description,
    this.externalUrls,
    this.followers,
    this.href,
    this.id,
    this.images,
    this.name,
    this.owner,
    this.primaryColor,
    this.public,
    this.snapshotId,
    this.tracks,
    this.type,
    this.uri,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) {
    return Playlist(
      collaborative: json['collaborative'] as bool,
      description: json['description'] as String,
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      followers: json['followers'] == null
          ? null
          : Followers.fromJson(json['followers'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      images: (json['images'] as List<dynamic>)
          ?.map((e) =>
              e == null ? null : Images.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      name: json['name'] as String,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      primaryColor: json['primary_color'],
      public: json['public'] as bool,
      snapshotId: json['snapshot_id'] as String,
      tracks: json['tracks'] == null
          ? null
          : Tracks.fromJson(json['tracks'] as Map<String, dynamic>),
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collaborative': collaborative,
      'description': description,
      'external_urls': externalUrls?.toJson(),
      'followers': followers?.toJson(),
      'href': href,
      'id': id,
      'images': images?.map((e) => e?.toJson())?.toList(),
      'name': name,
      'owner': owner?.toJson(),
      'primary_color': primaryColor,
      'public': public,
      'snapshot_id': snapshotId,
      'tracks': tracks?.toJson(),
      'type': type,
      'uri': uri,
    };
  }
}
