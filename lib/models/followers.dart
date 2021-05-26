class Followers {
  dynamic href;
  int total;

  Followers({this.href, this.total});

  factory Followers.fromJson(Map<String, dynamic> json) {
    return Followers(
      href: json['href'],
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'href': href,
      'total': total,
    };
  }
}
