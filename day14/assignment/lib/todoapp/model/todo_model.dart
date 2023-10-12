class TodoModel {
  final int userId; // : 1,
  final int id; // : 1,
  final String title; // : "delectus aut autem",
  final bool completed;

  const TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'completed': this.completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  @override
  String toString() {
    return 'TodoModel{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}