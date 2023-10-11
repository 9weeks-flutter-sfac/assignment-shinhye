class Model78 {
  final int id;
  final String advice;

  Model78({
    required this.id,
    required this.advice,
  });

  factory Model78.fromJson({required Map<String, dynamic> json}) {
    return Model78(
      id: json['id'],
      advice: json['advice'],
    );
  }

  @override
  String toString() {
    return 'Requested is ...\n\nid: $id\nadvice: $advice';
  }
}
