class Homemodel {
  final String image;
  final String clothesType;
  final double price;
  final String description;
  final int id;

Homemodel({
    required this.id,
    required this.image,
    required this.clothesType,
    required this.price,
    required this.description,
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
}
