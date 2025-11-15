class Product {
  final int id;
  final String name;
  final double price;
  final double? oldPrice;
  final List<String> images;
  final String? discount;
  final String? description;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.price,
    this.oldPrice,
    required this.images,
    this.discount,
    this.description,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      oldPrice: json['oldPrice']?.toDouble(),
      images: List<String>.from(json['images']),
      discount: json['discount'],
      description: json['description'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'images': images,
      'discount': discount,
      'description': description,
      'category': category,
    };
  }
}