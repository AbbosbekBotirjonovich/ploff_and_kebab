class CategoryProductModel {
  List<Category> categories;
  String count;

  CategoryProductModel({
    required this.categories,
    required this.count,
  });

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) => CategoryProductModel(
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "count": count,
  };
}

class Category {
  String id;
  String slug;
  String parentId;
  String image;
  Description description;
  Description title;
  String orderNo;
  bool active;
  List<Product> products;

  Category({
    required this.id,
    required this.slug,
    required this.parentId,
    required this.image,
    required this.description,
    required this.title,
    required this.orderNo,
    required this.active,
    required this.products,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    slug: json["slug"],
    parentId: json["parent_id"],
    image: json["image"],
    description: Description.fromJson(json["description"]),
    title: Description.fromJson(json["title"]),
    orderNo: json["order_no"],
    active: json["active"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "parent_id": parentId,
    "image": image,
    "description": description.toJson(),
    "title": title.toJson(),
    "order_no": orderNo,
    "active": active,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Description {
  String uz;
  String ru;
  String en;

  Description({
    required this.uz,
    required this.ru,
    required this.en,
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

class Product {
  String id;
  int outPrice;
  Currency currency;
  String string;
  Type type;
  List<String> categories;
  String brandId;
  String rateId;
  String image;
  bool activeInMenu;
  bool hasModifier;
  String fromTime;
  String toTime;
  bool offAlways;
  dynamic gallery;
  Description title;
  Description description;
  bool active;
  String iikoId;
  String jowiId;
  dynamic discounts;

  Product({
    required this.id,
    required this.outPrice,
    required this.currency,
    required this.string,
    required this.type,
    required this.categories,
    required this.brandId,
    required this.rateId,
    required this.image,
    required this.activeInMenu,
    required this.hasModifier,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    required this.gallery,
    required this.title,
    required this.description,
    required this.active,
    required this.iikoId,
    required this.jowiId,
    required this.discounts,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    outPrice: json["out_price"],
    currency: currencyValues.map[json["currency"]]!,
    string: json["string"],
    type: typeValues.map[json["type"]]!,
    categories: List<String>.from(json["categories"].map((x) => x)),
    brandId: json["brand_id"],
    rateId: json["rate_id"],
    image: json["image"],
    activeInMenu: json["active_in_menu"],
    hasModifier: json["has_modifier"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    offAlways: json["off_always"],
    gallery: json["gallery"],
    title: Description.fromJson(json["title"]),
    description: Description.fromJson(json["description"]),
    active: json["active"],
    iikoId: json["iiko_id"],
    jowiId: json["jowi_id"],
    discounts: json["discounts"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "out_price": outPrice,
    "currency": currencyValues.reverse[currency],
    "string": string,
    "type": typeValues.reverse[type],
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "brand_id": brandId,
    "rate_id": rateId,
    "image": image,
    "active_in_menu": activeInMenu,
    "has_modifier": hasModifier,
    "from_time": fromTime,
    "to_time": toTime,
    "off_always": offAlways,
    "gallery": gallery,
    "title": title.toJson(),
    "description": description.toJson(),
    "active": active,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
    "discounts": discounts,
  };
}

enum Currency {
  UZS
}

final currencyValues = EnumValues({
  "UZS": Currency.UZS
});

enum Type {
  COMBO,
  ORIGIN,
  SIMPLE
}

final typeValues = EnumValues({
  "combo": Type.COMBO,
  "origin": Type.ORIGIN,
  "simple": Type.SIMPLE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
