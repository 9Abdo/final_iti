class Homemodel {
  final String image;
  final String clothesType;
  final double price;
  final String description;
  final int id;
   int quantity;


Homemodel({
    required this.id,
    required this.image,
    required this.clothesType,
    required this.price,
    required this.description,
    this.quantity = 1,
  });
  factory Homemodel.fromjson(Map<String, dynamic> json) {
    return Homemodel(
      id: int.tryParse(json['id'].toString()) ?? 0,
      image: json['images'][0] ?? "",
      clothesType: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
    );
  }
  // to convert data to json
  factory Homemodel.fromFirestore(Map<String, dynamic> json) {
    return Homemodel(
      id: json["id"],
      image: json["image"],
      clothesType: json["title"],
      price: (json["price"] as num).toDouble(),
      description: json["description"],
      quantity: json["quantity"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "title": clothesType,
      "price": price,
      "description": description,
      "quantity": quantity,
    };
  }
}
