class Images {
  dynamic height;
  String url;
  dynamic width;

  Images({
    this.height,
    this.url,
    this.width,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      height: json['height'],
      url: json['url'] as String,
      width: json['width'],
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
