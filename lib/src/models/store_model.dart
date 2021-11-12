import 'dart:convert';

List<Store> storeFromJson(String str) =>
    List<Store>.from(json.decode(str).map((x) => Store.fromJson(x)));

String storeToJson(List<Store> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Store {
  Store({
    this.address,
    this.imageurl,
    this.name,
    this.score,
    this.category,
  });

  String? address;
  String? imageurl;
  String? name;
  double? score;
  String? category;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
      address: json["address"],
      imageurl: json["imageurl"],
      name: json["name"],
      score: json["score"].toDouble(),
      category: json['category']);

  Map<String, dynamic> toJson() => {
        "address": address,
        "imageurl": imageurl,
        "name": name,
        "score": score,
        'category': category,
      };
}
