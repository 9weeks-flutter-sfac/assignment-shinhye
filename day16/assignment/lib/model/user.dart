class User {
  String id;
  String username;
  String email;
  String name;
  String avatar;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.name,
    required this.avatar,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      username: map['username'] as String,
      email: map['email'] as String,
      name: map['name'] as String,
      avatar: map['avatar'],
    );
  }
}

// "token": "JWT_TOKEN",
// "record": {
//   "id": "RECORD_ID",
//   "collectionId": "_pb_users_auth_",
//   "collectionName": "users",
//   "created": "2022-01-01 01:00:00Z",
//   "updated": "2022-01-01 23:59:59Z",
//   "username": "username123",
//   "verified": false,
//   "emailVisibility": true,
//   "email": "test@example.com",
//   "name": "test",
//   "avatar": "filename.jpg"
// }