class ProductSearchModel {
  List<SearchProduct> products;
  String count;

  ProductSearchModel({
    required this.products,
    required this.count,
  });

  factory ProductSearchModel.fromJson(Map<String, dynamic> json) => ProductSearchModel(
    products: List<SearchProduct>.from(json["products"].map((x) => SearchProduct.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "count": count,
  };
}

class SearchProduct {
  bool active;
  bool isDivisible;
  bool hasModifier;
  String order;
  int inPrice;
  int outPrice;
  String currency;
  String count;
  String id;
  String slug;
  String image;
  String code;
  dynamic gallery;
  String iikoId;
  String jowiId;
  Description description;
  Description title;
  Brand brand;
  Measurement measurement;
  Rate rate;
  bool activeInMenu;
  String fromTime;
  String toTime;
  bool offAlways;
  dynamic favorites;
  List<Brand> categories;
  dynamic tags;
  dynamic productProperty;
  dynamic priceChangers;
  dynamic properties;
  dynamic variantProducts;
  String type;

  SearchProduct({
    required this.active,
    required this.isDivisible,
    required this.hasModifier,
    required this.order,
    required this.inPrice,
    required this.outPrice,
    required this.currency,
    required this.count,
    required this.id,
    required this.slug,
    required this.image,
    required this.code,
    required this.gallery,
    required this.iikoId,
    required this.jowiId,
    required this.description,
    required this.title,
    required this.brand,
    required this.measurement,
    required this.rate,
    required this.activeInMenu,
    required this.fromTime,
    required this.toTime,
    required this.offAlways,
    required this.favorites,
    required this.categories,
    required this.tags,
    required this.productProperty,
    required this.priceChangers,
    required this.properties,
    required this.variantProducts,
    required this.type,
  });

  factory SearchProduct.fromJson(Map<String, dynamic> json) => SearchProduct(
    active: json["active"],
    isDivisible: json["is_divisible"],
    hasModifier: json["has_modifier"],
    order: json["order"],
    inPrice: json["in_price"],
    outPrice: json["out_price"],
    currency: json["currency"],
    count: json["count"],
    id: json["id"],
    slug: json["slug"],
    image: json["image"],
    code: json["code"],
    gallery: json["gallery"],
    iikoId: json["iiko_id"],
    jowiId: json["jowi_id"],
    description: Description.fromJson(json["description"]),
    title: Description.fromJson(json["title"]),
    brand: Brand.fromJson(json["brand"]),
    measurement: Measurement.fromJson(json["measurement"]),
    rate: Rate.fromJson(json["rate"]),
    activeInMenu: json["active_in_menu"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    offAlways: json["off_always"],
    favorites: json["favorites"],
    categories: List<Brand>.from(json["categories"].map((x) => Brand.fromJson(x))),
    tags: json["tags"],
    productProperty: json["product_property"],
    priceChangers: json["price_changers"],
    properties: json["properties"],
    variantProducts: json["variant_products"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "active": active,
    "is_divisible": isDivisible,
    "has_modifier": hasModifier,
    "order": order,
    "in_price": inPrice,
    "out_price": outPrice,
    "currency": currency,
    "count": count,
    "id": id,
    "slug": slug,
    "image": image,
    "code": code,
    "gallery": gallery,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
    "description": description.toJson(),
    "title": title.toJson(),
    "brand": brand.toJson(),
    "measurement": measurement.toJson(),
    "rate": rate.toJson(),
    "active_in_menu": activeInMenu,
    "from_time": fromTime,
    "to_time": toTime,
    "off_always": offAlways,
    "favorites": favorites,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "tags": tags,
    "product_property": productProperty,
    "price_changers": priceChangers,
    "properties": properties,
    "variant_products": variantProducts,
    "type": type,
  };
}

class Brand {
  String id;
  String slug;
  String parentId;
  String image;
  Description description;
  Description title;
  String orderNo;
  bool? isActive;
  bool? active;
  dynamic products;

  Brand({
    required this.id,
    required this.slug,
    required this.parentId,
    required this.image,
    required this.description,
    required this.title,
    required this.orderNo,
    this.isActive,
    this.active,
    this.products,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    slug: json["slug"],
    parentId: json["parent_id"],
    image: json["image"],
    description: Description.fromJson(json["description"]),
    title: Description.fromJson(json["title"]),
    orderNo: json["order_no"],
    isActive: json["is_active"],
    active: json["active"],
    products: json["products"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "parent_id": parentId,
    "image": image,
    "description": description.toJson(),
    "title": title.toJson(),
    "order_no": orderNo,
    "is_active": isActive,
    "active": active,
    "products": products,
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

class Measurement {
  String id;
  String slug;
  Description title;
  String shortName;
  int accuracy;

  Measurement({
    required this.id,
    required this.slug,
    required this.title,
    required this.shortName,
    required this.accuracy,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    slug: json["slug"],
    title: Description.fromJson(json["title"]),
    shortName: json["short_name"],
    accuracy: json["accuracy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title.toJson(),
    "short_name": shortName,
    "accuracy": accuracy,
  };
}

class Rate {
  String id;
  String slug;
  String code;
  String rateAmount;
  String title;

  Rate({
    required this.id,
    required this.slug,
    required this.code,
    required this.rateAmount,
    required this.title,
  });

  factory Rate.fromJson(Map<String, dynamic> json) => Rate(
    id: json["id"],
    slug: json["slug"],
    code: json["code"],
    rateAmount: json["rate_amount"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "code": code,
    "rate_amount": rateAmount,
    "title": title,
  };
}
