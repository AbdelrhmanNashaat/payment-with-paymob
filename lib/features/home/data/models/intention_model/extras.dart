class Extras {
  final int ee;

  Extras({required this.ee});

  factory Extras.fromJson(Map<String, dynamic> json) => Extras(
        ee: json['ee'] as int,
      );

  Map<String, dynamic> toJson() => {
        'ee': ee,
      };
}
