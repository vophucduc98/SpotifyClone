import 'external_urls.dart';

class Owner {
  String displayName;
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  Owner({
    this.displayName,
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      displayName: json['display_name'] as String,
      externalUrls: json['external_urls'] == null
          ? null
          : ExternalUrls.fromJson(
              json['external_urls'] as Map<String, dynamic>),
      href: json['href'] as String,
      id: json['id'] as String,
      type: json['type'] as String,
      uri: json['uri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': displayName,
      'external_urls': externalUrls?.toJson(),
      'href': href,
      'id': id,
      'type': type,
      'uri': uri,
    };
  }
}
