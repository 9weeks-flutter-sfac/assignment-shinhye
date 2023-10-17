class Secret {
  final String id;
  final String collectionId;
  final String collectionName;
  final String created;
  final String updated;
  final String secret;
  final String author;
  final String authorName;

  const Secret({
    required this.id,
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.updated,
    required this.secret,
    required this.author,
    required this.authorName,
  });

  factory Secret.fromMap(Map<String, dynamic> map) {
    return Secret(
      id: map['id'] ?? '',
      collectionId: map['collectionId'] ?? '',
      collectionName: map['collectionName'] ?? '',
      created: map['created'] ?? '',
      updated: map['updated'] ?? '',
      secret: map['secret'] ?? '',
      author: map['author'] ?? '',
      authorName: map['authorName'] ?? '',
    );
  }

  @override
  String toString() {
    return 'Secret{id: $id, collectionId: $collectionId, collectionName: $collectionName, created: $created, updated: $updated, secret: $secret, author: $author, authorName: $authorName}';
  }
}

// "id": "RECORD_ID",
// "collectionId": "5647cebjvtwtcu1",
// "collectionName": "secrets",
// "created": "2022-01-01 01:00:00Z",
// "updated": "2022-01-01 23:59:59Z",
// "secret": "test",
// "author": "RELATION_RECORD_ID",
// "authorName": "test",

// author: ,
// authorName: ,
// collectionId: 5647cebjvtwtcu1,
// collectionName: secrets,
// created: 2023-10-15 19:46:21.353Z,
// id: a065eibr056z5bd,
// secret: ㄱㄱ,
// updated: 2023-10-15 19:46:21.353Z,
