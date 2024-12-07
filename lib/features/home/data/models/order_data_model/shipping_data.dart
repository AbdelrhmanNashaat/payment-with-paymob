class ShippingData {
  String? apartment;
  String? email;
  String? floor;
  String? firstName;
  String? street;
  String? building;
  String? phoneNumber;
  String? postalCode;
  String? extraDescription;
  String? city;
  String? country;
  String? lastName;
  String? state;

  ShippingData({
    this.apartment,
    this.email,
    this.floor,
    this.firstName,
    this.street,
    this.building,
    this.phoneNumber,
    this.postalCode,
    this.extraDescription,
    this.city,
    this.country,
    this.lastName,
    this.state,
  });

  factory ShippingData.fromJson(Map<String, dynamic> json) => ShippingData(
        apartment: json['apartment'] as String?,
        email: json['email'] as String?,
        floor: json['floor'] as String?,
        firstName: json['first_name'] as String?,
        street: json['street'] as String?,
        building: json['building'] as String?,
        phoneNumber: json['phone_number'] as String?,
        postalCode: json['postal_code'] as String?,
        extraDescription: json['extra_description'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        lastName: json['last_name'] as String?,
        state: json['state'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'apartment': apartment,
        'email': email,
        'floor': floor,
        'first_name': firstName,
        'street': street,
        'building': building,
        'phone_number': phoneNumber,
        'postal_code': postalCode,
        'extra_description': extraDescription,
        'city': city,
        'country': country,
        'last_name': lastName,
        'state': state,
      };
}
