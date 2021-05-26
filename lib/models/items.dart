import 'added_by.dart';
import 'track.dart';
import 'video_thumbnail.dart';

class Items {
  DateTime addedAt;
  AddedBy addedBy;
  bool isLocal;
  dynamic primaryColor;
  Track track;
  VideoThumbnail videoThumbnail;

  Items({
    this.addedAt,
    this.addedBy,
    this.isLocal,
    this.primaryColor,
    this.track,
    this.videoThumbnail,
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      addedAt: json['added_at'] == null
          ? null
          : DateTime.parse(json['added_at'] as String),
      addedBy: json['added_by'] == null
          ? null
          : AddedBy.fromJson(json['added_by'] as Map<String, dynamic>),
      isLocal: json['is_local'] as bool,
      primaryColor: json['primary_color'],
      track: json['track'] == null
          ? null
          : Track.fromJson(json['track'] as Map<String, dynamic>),
      videoThumbnail: json['video_thumbnail'] == null
          ? null
          : VideoThumbnail.fromJson(
              json['video_thumbnail'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'added_at': addedAt?.toIso8601String(),
      'added_by': addedBy?.toJson(),
      'is_local': isLocal,
      'primary_color': primaryColor,
      'track': track?.toJson(),
      'video_thumbnail': videoThumbnail?.toJson(),
    };
  }
}
