import 'address.dart';

class Jobs {
  int? id;
  String? title;
  Address? pickup;
  Address? dropOff;
  DateTime? datePosted;
  DateTime? expectedDeliveryDate;

  Jobs({
    this.id,
    this.title,
    this.pickup,
    this.dropOff,
    this.datePosted,
    this.expectedDeliveryDate,
  });

  factory Jobs.fromJson(Map<String, dynamic> json) => Jobs(
        id: json["id"],
        title: json["title"],
        pickup: Address.fromJson(json["pickup"]),
        dropOff: Address.fromJson(json["drop_off"]),
        datePosted: DateTime.parse(json["date_posted"]),
        expectedDeliveryDate: DateTime.parse(json["expected_delivery_date"]),
      );
}
