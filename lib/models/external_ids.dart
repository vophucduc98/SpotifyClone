class ExternalIds {
  String isrc;

  ExternalIds({this.isrc});

  factory ExternalIds.fromJson(Map<String, dynamic> json) {
    return ExternalIds(
      isrc: json['isrc'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isrc': isrc,
    };
  }
}
