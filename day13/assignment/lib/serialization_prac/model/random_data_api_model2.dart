class RandomNationModel {
  final int id; // : 7573,
  final String uid; // : "6983292f-9b7f-46e8-b55c-334383c70c30",
  final String nationality; // : "English",
  final String language; // : "Korean",
  final String capital; // : "Pyongyang",
  final String national_sport; // : "field hockey",
  final String flag; // : "🇨🇳"

  const RandomNationModel({
    required this.id,
    required this.uid,
    required this.nationality,
    required this.language,
    required this.capital,
    required this.national_sport,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'uid': this.uid,
      'nationality': this.nationality,
      'language': this.language,
      'capital': this.capital,
      'national_sport': this.national_sport,
      'flag': this.flag,
    };
  }

  factory RandomNationModel.fromJson({required Map<String, dynamic> json}) {
    return RandomNationModel(
      id: json['id'] as int,
      uid: json['uid'] as String,
      nationality: json['nationality'] as String,
      language: json['language'] as String,
      capital: json['capital'] as String,
      national_sport: json['national_sport'] as String,
      flag: json['flag'] as String,
    );
  }

  @override
  String toString() {
    return 'RandomNationModel{id: $id, uid: $uid, nationality: $nationality, language: $language, capital: $capital, national_sport: $national_sport, flag: $flag}';
  }
}
