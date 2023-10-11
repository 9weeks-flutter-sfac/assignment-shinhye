class Model79 {
  final String activity; // : "Hold a yard sale",
  final String type; // : "social",
  final int participants; // : 1,
  final int price; // : 0,
  final String link; // : "",
  final String key; // : "1432113",
  final double accessibility; // : 0.1

  Model79({
    required this.activity,
    required this.type,
    required this.participants,
    required this.price,
    required this.link,
    required this.key,
    required this.accessibility,
  });

  factory Model79.fromJson({required Map<String, dynamic> json}) {
    return Model79(
      activity: json['activity'],
      type: json['type'],
      participants: json['participants'],
      price: json['price'],
      link: json['link'],
      key: json['key'],
      accessibility: json['accessibility'],
    );
  }

  @override
  String toString() {
    return '''Requested is ...
    
activity: $activity,
type: $type,
participants: $participants,
price: $price,
link: $link,
key: $key,
accessibility: $accessibility,
    ''';
  }
}
