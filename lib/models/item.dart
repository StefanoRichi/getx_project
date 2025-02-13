import 'dart:convert';

List<Items> itemsFromJson(String str) =>
    List<Items>.from(json.decode(str).map((x) => Items.fromJson(x)));

class Items {
  String? id;
  String? name;
  double? price;
  int qty;
  String? image;

  Items({
    this.id,
    this.name,
    this.price,
    required this.qty,
    this.image,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        qty: json["qty"] ?? 0,
        image: json["image"],
      );
}
