// name: "스나이퍼팩토리 플러터 과정",
// description: "스나이퍼팩토리의 플러터 과정입니다! 지금 바로 신청해볼까요?",
// image: "https://picsum.photos/200/200",
// price: 4000000

class CourseModel {
  String name;
  String description;
  String image;
  int price;

  CourseModel({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });

  CourseModel.fromJson({required Map<String, dynamic> json})
      : name = json['name'],
        description = json['description'],
        image = json['image'],
        price = json['price'];
}
