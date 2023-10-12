class Dict {
  final String word;
  final String? phonetic;
  final List<Phonetics> phonetics;
  final List<Meanings> meanings;
  final License? license;
  final List<String> sourceUrls;

  const Dict({
    required this.word,
    this.phonetic,
    required this.phonetics,
    required this.meanings,
    required this.license,
    required this.sourceUrls,
  });

  factory Dict.fromMap(Map<String, dynamic> map) {
    return Dict(
      word: map['word'] as String,
      phonetic: map['phonetic'],
      phonetics: List<Map<String, dynamic>>.from(map['phonetics'])
          .map((e) => Phonetics.fromMap(e))
          .toList(),
      meanings: List<Map<String, dynamic>>.from(map['meanings'])
          .map((e) => Meanings.fromMap(e))
          .toList(),
      license: License.fromMap(map['license']),
      sourceUrls: List<String>.from(map['sourceUrls']),
    );
  }
}

class Phonetics {
  final String? text;
  final String audio;
  final String? sourceUrl;
  final License? license;

  const Phonetics({
    this.text,
    required this.audio,
    this.sourceUrl,
    this.license,
  });

  factory Phonetics.fromMap(Map<String, dynamic> map) {
    return Phonetics(
      text: map['text'],
      audio: map['audio'],
      sourceUrl: map['sourceUrl'],
      license: map['license'] == null ? null : License.fromMap(map['license']),
    );
  }
}

class License {
  final String name;
  final String url;

  const License({
    required this.name,
    required this.url,
  });

  factory License.fromMap(Map<String, dynamic> map) {
    return License(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }
}

class Meanings {
  final String partOfSpeech;
  final List<Definitions> definitions;

  const Meanings({
    required this.partOfSpeech,
    required this.definitions,
  });

  factory Meanings.fromMap(Map<String, dynamic> map) {
    return Meanings(
      partOfSpeech: map['partOfSpeech'] as String,
      definitions: List<Map<String, dynamic>>.from(map['definitions'])
          .map((e) => Definitions.fromMap(e))
          .toList(),
    );
  }
}

class Definitions {
  final String definition;
  final List<String> synonyms;
  final List<String> antonyms;
  final String? example;

  const Definitions({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory Definitions.fromMap(Map<String, dynamic> map) {
    return Definitions(
      definition: map['definition'] as String,
      synonyms: List<String>.from(map['synonyms']),
      antonyms: List<String>.from(map['antonyms']),
      example: map['example'] ?? '',
    );
  }
}
