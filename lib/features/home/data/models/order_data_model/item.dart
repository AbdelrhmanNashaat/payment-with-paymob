class Item {
  String? name;
  String? amountCents;
  String? description;
  String? quantity;

  Item({this.name, this.amountCents, this.description, this.quantity});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json['name'] as String?,
        amountCents: json['amount_cents'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'amount_cents': amountCents,
        'description': description,
        'quantity': quantity,
      };
}
