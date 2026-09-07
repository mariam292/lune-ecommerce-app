class ProductModel {
  final String id;
  final String image, name, description;
  final List<String> category;
  final double price;

  ProductModel({
    required this.id,
    required this.image,
    required this.category,
    required this.name,
    required this.description,
    required this.price,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      image: json['coverPictureUrl'],
      category: List<String>.from(json['categories']),
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
    );
  }
}
