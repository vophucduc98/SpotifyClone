class Images {
  int height;
  String url;
  int width;

  Images({
    this.height,
    this.url,
    this.width,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      height: json['height'] as int,
      url: json['url'] as String,
      width: json['width'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height,
      'url': url,
      'width': width,
    };
  }
}
