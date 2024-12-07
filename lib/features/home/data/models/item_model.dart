class ItemModel {
  final String name;
  final String color;
  final String price;
  final String image;
  final String? quantity;

  ItemModel({
    required this.name,
    required this.color,
    required this.price,
    required this.image,
    this.quantity,
  });
}
