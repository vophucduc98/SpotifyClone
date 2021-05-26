class VideoThumbnail {
  dynamic url;

  VideoThumbnail({this.url});

  factory VideoThumbnail.fromJson(Map<String, dynamic> json) {
    return VideoThumbnail(
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
    };
  }
}
