class Item {
  final String name;
  final int amount;
  final String description;
  final int quantity;

  Item({
    required this.name,
    required this.amount,
    required this.description,
    required this.quantity,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String,
        amount: json['amount'] as int,
        description: json['description'] as String,
        quantity: json['quantity'] as int,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount': amount,
        'description': description,
        'quantity': quantity,
      };
}
