class PostModel {
  final int userId; // : 1,
  final int id; // : 1,
  final String
      title; // : "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  final String body; // : "quia et suscipit"

  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson({required Map<String, dynamic> json}) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
