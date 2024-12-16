class BillingData {
  String? apartment;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? phoneNumber;
  String? city;
  String? country;
  String? email;
  String? floor;
  String? state;

  BillingData({
    this.apartment,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.phoneNumber,
    this.city,
    this.country,
    this.email,
    this.floor,
    this.state,
  });

  factory BillingData.fromJson(Map<String, dynamic> json) => BillingData(
        apartment: json['apartment'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        street: json['street'] as String?,
        building: json['building'] as String?,
        phoneNumber: json['phone_number'] as String?,
        city: json['city'] as String?,
        country: json['country'] as String?,
        email: json['email'] as String?,
        floor: json['floor'] as String?,
        state: json['state'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'apartment': apartment,
        'first_name': firstName,
        'last_name': lastName,
        'street': street,
        'building': building,
        'phone_number': phoneNumber,
        'city': city,
        'country': country,
        'email': email,
        'floor': floor,
        'state': state,
      };
}
