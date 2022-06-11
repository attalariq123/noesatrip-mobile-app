import 'dart:convert';

class Destination {
  int? id;
  String? kode;
  String? name;
  String? description;
  String? price;
  String? city;
  String? imagePath;
  String? overallRating;
  int? totalReview;

  Destination({
    this.id,
    this.kode,
    this.name,
    this.description,
    this.price,
    this.city,
    this.imagePath,
    this.overallRating,
    this.totalReview,
  });

  factory Destination.fromJson(Map<String, dynamic> json) => Destination(
        id: json["id"],
        kode: json["kode"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        city: json["city"],
        imagePath: json["image_path"],
        overallRating: json["overall_rating"],
        totalReview: json["total_review"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kode": kode,
        "name": name,
        "description": description,
        "price": price,
        "city": city,
        "image_path": imagePath,
        "overall_rating": overallRating,
        "total_review": totalReview,
      };
}

Destination destinationFromJson(String str) =>
    Destination.fromJson(json.decode(str));

String destinationToJson(Destination data) => json.encode(data.toJson());
