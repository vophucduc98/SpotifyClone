import 'added_by_external_urls.dart';

class AddedBy {
  ExternalUrls externalUrls;
  String href;
  String id;
  String type;
  String uri;

  AddedBy({
    this.externalUrls,
    this.href,
    this.id,
    this.type,
    this.uri,
  });

  factory AddedBy.fromJson(Map<String, dynamic> json) {
    return AddedBy(
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
      'external_urls': externalUrls?.toJson(),
      'href': href,
      'id': id,
      'type': type,
      'uri': uri,
    };
  }
}
