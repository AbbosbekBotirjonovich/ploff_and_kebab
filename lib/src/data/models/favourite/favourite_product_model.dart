import 'package:hive/hive.dart';

part 'favourite_product_model.g.dart';

@HiveType(typeId: 0)
class FavouriteProductModel {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final Description? title;
  @HiveField(3)
  final Description? description;
  @HiveField(4)
  final int? price;
  @HiveField(5)
  final int? outPrice;
  @HiveField(6)
  final int? count;

  FavouriteProductModel({
    this.id,
    this.image,
    this.title,
    this.description,
    this.price,
    this.outPrice,
    this.count,
  });

  factory FavouriteProductModel.fromJson(Map<String, dynamic> json) => FavouriteProductModel(
    id: json["id"],
    image: json["image"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    price: json["price"],
    outPrice: json["out_price"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "title": title?.toJson(),
    "description": description?.toJson(),
    "price": price,
    "out_price": outPrice,
    "count": count,
  };
}

@HiveType(typeId: 1)
class Description {
  @HiveField(0)
  final String? uz;
  @HiveField(1)
  final String? ru;
  @HiveField(2)
  final String? en;

  Description({
    this.uz,
    this.ru,
    this.en,
  });

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    uz: json["uz"],
    ru: json["ru"],
    en: json["en"],
  );

  Map<String, dynamic> toJson() => {
    "uz": uz,
    "ru": ru,
    "en": en,
  };
}
