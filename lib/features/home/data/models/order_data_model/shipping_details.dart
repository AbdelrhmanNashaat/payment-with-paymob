class ShippingDetails {
  String? notes;
  int? numberOfPackages;
  int? weight;
  String? weightUnit;
  int? length;
  int? width;
  int? height;
  String? contents;

  ShippingDetails({
    this.notes,
    this.numberOfPackages,
    this.weight,
    this.weightUnit,
    this.length,
    this.width,
    this.height,
    this.contents,
  });

  factory ShippingDetails.fromJson(Map<String, dynamic> json) {
    return ShippingDetails(
      notes: json['notes'] as String?,
      numberOfPackages: json['number_of_packages'] as int?,
      weight: json['weight'] as int?,
      weightUnit: json['weight_unit'] as String?,
      length: json['length'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
      contents: json['contents'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'notes': notes,
        'number_of_packages': numberOfPackages,
        'weight': weight,
        'weight_unit': weightUnit,
        'length': length,
        'width': width,
        'height': height,
        'contents': contents,
      };
}
