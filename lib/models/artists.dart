import 'artists_external_urls_1.dart';

class Artists {
  ExternalUrls externalUrls;
  String href;
  String id;
  String name;
  String type;
  String uri;

  Artists({
    this.externalUrls,
    this.href,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  factory Artists.fromJson(Map<String, dynamic> json) {
    return Artists(
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'external_urls': externalUrls?.toJson(),
      'href': href,
      'id': id,
      'name': name,
      'type': type,
      'uri': uri,
    };
  }
}
