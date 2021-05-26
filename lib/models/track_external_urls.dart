class ExternalUrls {
  String spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) {
    return ExternalUrls(
      spotify: json['spotify'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'spotify': spotify,
    };
  }
}
