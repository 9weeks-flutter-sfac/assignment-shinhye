class CharacterModel {
  final int id;
  final String name;
  // final String status;
  // final String species;
  // final String type;
  // final String gender;
  // final OriginModel origin;
  // final LocationModel location;
  final String image;
  // final List<String> episodes;
  // final String url;
  // final DateTime created;

  CharacterModel({
    required this.id,
    required this.name,
    // required this.status,
    // required this.species,
    // required this.type,
    // required this.gender,
    // required this.origin,
    // required this.location,
    required this.image,
    // required this.episodes,
    // required this.url,
    // required this.created,
  });

  factory CharacterModel.fromMap(Map<String, dynamic> map) {
    return CharacterModel(
      id: map['id'] as int,
      name: map['name'] as String,
      // status: map['status'] as String,
      // species: map['species'] as String,
      // type: map['type'] as String,
      // gender: map['gender'] as String,
      // origin: map['origin'] as OriginModel,
      // location: map['location'] as LocationModel,
      image: map['image'] as String,
      // episodes: map['episodes'] as List<String>,
      // url: map['url'] as String,
      // created: map['created'] as DateTime,
    );
  }

  @override
  String toString() {
    return 'CharacterModel{id: $id, name: $name, image: $image}';
  }
}

class OriginModel {
  final String name;
  final String url;

  OriginModel({
    required this.name,
    required this.url,
  });
}

class LocationModel {
  final String name;
  final String url;

  LocationModel({
    required this.name,
    required this.url,
  });

  factory LocationModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    return LocationModel(
      name: json['name'],
      url: json['url'],
    );
  }

  @override
  String toString() {
    return 'LocationModel{name: $name, url: $url}';
  }
}

// id: 8,
// name: "Adjudicator Rick",
// status: "Dead",
// species: "Human",
// type: "",
// gender: "Male",
// origin: {
// name: "unknown",
// url: ""
// },
// location: {
// name: "Citadel of Ricks",
// url: "https://rickandmortyapi.com/api/location/3"
// },
// image: "https://rickandmortyapi.com/api/character/avatar/8.jpeg",
// episode: [
// "https://rickandmortyapi.com/api/episode/28"
// ],
// url: "https://rickandmortyapi.com/api/character/8",
// created: "2017-11-04T20:03:34.737Z"
