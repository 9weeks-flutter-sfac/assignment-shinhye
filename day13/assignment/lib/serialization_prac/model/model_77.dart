class Model77 {
  final String fact;
  final int length;

  Model77({
    required this.fact,
    required this.length,
  });

  factory Model77.fromJson({required Map<String, dynamic> json}) {
    return Model77(
      fact: json['fact'],
      length: json['length'],
    );
  }

  @override
  String toString() {
    return 'Requested Data is ...\n\nfact: ${fact}\nlength: ${length}';
  }
}
