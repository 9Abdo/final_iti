class SearchModel {
  final String title;
  final String descrption;
  final double price;
  final List<String> image;

  SearchModel({
    required this.title,
    required this.descrption,
    required this.price,
    required this.image,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      title: json['title'] as String,
      descrption: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: List<String>.from(json['images']),
    );
  }
}