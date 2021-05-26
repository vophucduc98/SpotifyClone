import 'items.dart';

class Tracks {
  String href;
  List<Items> items;
  int limit;
  dynamic next;
  int offset;
  dynamic previous;
  int total;

  Tracks({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Tracks.fromJson(Map<String, dynamic> json) {
    return Tracks(
      href: json['href'] as String,
      items: (json['items'] as List<dynamic>)
          ?.map((e) =>
              e == null ? null : Items.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      limit: json['limit'] as int,
      next: json['next'],
      offset: json['offset'] as int,
      previous: json['previous'],
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'items': items?.map((e) => e?.toJson())?.toList(),
      'limit': limit,
      'next': next,
      'offset': offset,
      'previous': previous,
      'total': total,
    };
  }
}
