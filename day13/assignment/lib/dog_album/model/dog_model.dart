class DogModel {
  final String
      message; //: "https://images.dog.ceo/breeds/saluki/n02091831_410.jpg",
  final String status; //: "success"

  DogModel({
    required this.message,
    required this.status,
  });

  factory DogModel.fromJson({required Map<String, dynamic> json}) {
    return DogModel(
      message: json['message'],
      status: json['status'],
    );
  }
}
