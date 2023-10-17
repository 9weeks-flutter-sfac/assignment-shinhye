class User {
  final String created;
  final String email;
  final String id;
  final String username;
  final bool verified;

  const User({
    required this.created,
    required this.email,
    required this.id,
    required this.username,
    required this.verified,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      created: map['created'],
      email: map['email'],
      id: map['id'],
      username: map['username'],
      verified: map['verified'],
    );
  }

  @override
  String toString() {
    return 'User{created: $created, email: $email, id: $id, username: $username, verified: $verified}';
  }
}

//"token": "JWT_TOKEN",
//"record": {
//  "id": "RECORD_ID",
//  "collectionId": "_pb_users_auth_",
//  "collectionName": "users",
//  "created": "2022-01-01 01:00:00Z",
//  "updated": "2022-01-01 23:59:59Z",
//  "username": "username123",
//  "verified": false,
//  "emailVisibility": true,
//  "email": "test@example.com",
//  "name": "test",
//  "avatar": "filename.jpg"
//}
