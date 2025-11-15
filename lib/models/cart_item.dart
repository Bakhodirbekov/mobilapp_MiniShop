class CartItem {
  final int id;
  final String name;
  final double price;
  final String image;
  final String size;
  final String color;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.size,
    required this.color,
    required this.quantity,
  });

  double get total => price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'image': image,
      'size': size,
      'color': color,
      'quantity': quantity,
    };
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      image: json['image'],
      size: json['size'],
      color: json['color'],
      quantity: json['quantity'],
    );
  }
}