class Address {
  String? addressLine1;
  String? postCode;

  Address({
    this.addressLine1,
    this.postCode,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addressLine1: json["address_line_1"],
        postCode: json["postcode"],
      );
}
