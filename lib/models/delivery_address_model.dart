class DeliveryAddress {
  String? street;
  String? city;
  String? state;
  String? postalCode;
  String? country;
  String? phoneNumber; // Added phone number field

  DeliveryAddress({
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
    this.phoneNumber,
  });

  DeliveryAddress.fromJson(Map<String, dynamic> json) {
    street = json['street'];
    city = json['city'];
    state = json['state'];
    postalCode = json['postalCode'];
    country = json['country'];
    phoneNumber = json['phoneNumber']; // Retrieve phone number from JSON
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['street'] = street;
    data['city'] = city;
    data['state'] = state;
    data['postalCode'] = postalCode;
    data['country'] = country;
    data['phoneNumber'] = phoneNumber; // Include phone number in JSON
    return data;
  }
}
