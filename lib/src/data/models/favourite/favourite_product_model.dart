import 'package:hive/hive.dart';

part 'favourite_product_model.g.dart';

@HiveType(typeId: 0)
class FavouriteProductModel  {
  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final FavouriteDescription? title;
  @HiveField(3)
  final FavouriteDescription? description;
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
}

@HiveType(typeId: 1)
class FavouriteDescription {
  @HiveField(0)
  final String? uz;
  @HiveField(1)
  final String? ru;
  @HiveField(2)
  final String? en;

  FavouriteDescription({
    this.uz,
    this.ru,
    this.en,
  });
}
