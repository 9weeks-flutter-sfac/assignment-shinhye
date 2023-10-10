class MenuModel {
  final String collectionId;
  final String collectionName;
  final DateTime created;
  final String description;
  final String id;
  final String imageUrl;
  final String menu;
  final int price;
  final DateTime updated;

  MenuModel({
    required this.collectionId,
    required this.collectionName,
    required this.created,
    required this.description,
    required this.id,
    required this.imageUrl,
    required this.menu,
    required this.price,
    required this.updated,
  });

  MenuModel.fromJson({required Map<String, dynamic> json})
      : collectionId = json['collectionId'],
        collectionName = json['collectionName'],
        created = DateTime.parse(json['created']),
        description = json['description'],
        id = json['id'],
        imageUrl = json['imageUrl'],
        menu = json['menu'],
        price = json['price'],
        updated = DateTime.parse(json['updated']);
}

// collectionId: "3z6i1lmnh7mdeyc",
// collectionName: "options",
// created: "2023-02-16 06:21:48.069Z",
// description: "맛있는 전라남도 떡볶이",
// id: "wtw7rn18czfar4g",
// imageUrl: "https://cdn.pixabay.com/photo/2020/10/14/06/42/toppokki-5653412_960_720.jpg",
// menu: "떡볶이",
// price: 4500,
// updated: "2023-02-16 06:21:48.069Z"
