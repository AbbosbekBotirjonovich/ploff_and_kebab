class OriginProductModel {
  String id;
  String slug;
  Description title;
  String code;
  Description description;
  List<Category> categories;
  Brand brand;
  bool isDivisible;
  String count;
  List<Tag> tags;
  Measurement measurement;
  dynamic rate;
  int inPrice;
  int outPrice;
  String image;
  List<dynamic> gallery;
  List<dynamic> favourites;
  bool active;
  String order;
  String createdAt;
  String iikoId;
  String jowiId;
  String shipperId;
  List<dynamic> priceChangers;
  String currency;
  String type;
  List<Brand> properties;
  List<dynamic> productProperty;
  String iikoSourceActionId;
  String iikoGroupId;
  bool activeInMenu;
  bool offAlways;
  String fromTime;
  String toTime;
  String ikpu;
  String packageCode;
  List<dynamic> variantProducts;
  String parentId;
  bool hasModifier;
  String rkeeperId;
  String crmName;
  String posterId;

  OriginProductModel({
    required this.id,
    required this.slug,
    required this.title,
    required this.code,
    required this.description,
    required this.categories,
    required this.brand,
    required this.isDivisible,
    required this.count,
    required this.tags,
    required this.measurement,
    required this.rate,
    required this.inPrice,
    required this.outPrice,
    required this.image,
    required this.gallery,
    required this.favourites,
    required this.active,
    required this.order,
    required this.createdAt,
    required this.iikoId,
    required this.jowiId,
    required this.shipperId,
    required this.priceChangers,
    required this.currency,
    required this.type,
    required this.properties,
    required this.productProperty,
    required this.iikoSourceActionId,
    required this.iikoGroupId,
    required this.activeInMenu,
    required this.offAlways,
    required this.fromTime,
    required this.toTime,
    required this.ikpu,
    required this.packageCode,
    required this.variantProducts,
    required this.parentId,
    required this.hasModifier,
    required this.rkeeperId,
    required this.crmName,
    required this.posterId,
  });

  factory OriginProductModel.fromJson(Map<String, dynamic> json) => OriginProductModel(
    id: json["id"],
    slug: json["slug"],
    title: Description.fromJson(json["title"]),
    code: json["code"],
    description: Description.fromJson(json["description"]),
    categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    brand: Brand.fromJson(json["brand"]),
    isDivisible: json["is_divisible"],
    count: json["count"],
    tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    measurement: Measurement.fromJson(json["measurement"]),
    rate: json["rate"],
    inPrice: json["in_price"],
    outPrice: json["out_price"],
    image: json["image"],
    gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
    favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
    active: json["active"],
    order: json["order"],
    createdAt: json["created_at"],
    iikoId: json["iiko_id"],
    jowiId: json["jowi_id"],
    shipperId: json["shipper_id"],
    priceChangers: List<dynamic>.from(json["price_changers"].map((x) => x)),
    currency: json["currency"],
    type: json["type"],
    properties: List<Brand>.from(json["properties"].map((x) => Brand.fromJson(x))),
    productProperty: List<dynamic>.from(json["product_property"].map((x) => x)),
    iikoSourceActionId: json["iiko_source_action_id"],
    iikoGroupId: json["iiko_group_id"],
    activeInMenu: json["active_in_menu"],
    offAlways: json["off_always"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    ikpu: json["ikpu"],
    packageCode: json["package_code"],
    variantProducts: List<dynamic>.from(json["variant_products"].map((x) => x)),
    parentId: json["parent_id"],
    hasModifier: json["has_modifier"],
    rkeeperId: json["rkeeper_id"],
    crmName: json["crm_name"],
    posterId: json["poster_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title.toJson(),
    "code": code,
    "description": description.toJson(),
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    "brand": brand.toJson(),
    "is_divisible": isDivisible,
    "count": count,
    "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    "measurement": measurement.toJson(),
    "rate": rate,
    "in_price": inPrice,
    "out_price": outPrice,
    "image": image,
    "gallery": List<dynamic>.from(gallery.map((x) => x)),
    "favourites": List<dynamic>.from(favourites.map((x) => x)),
    "active": active,
    "order": order,
    "created_at": createdAt,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
    "shipper_id": shipperId,
    "price_changers": List<dynamic>.from(priceChangers.map((x) => x)),
    "currency": currency,
    "type": type,
    "properties": List<dynamic>.from(properties.map((x) => x.toJson())),
    "product_property": List<dynamic>.from(productProperty.map((x) => x)),
    "iiko_source_action_id": iikoSourceActionId,
    "iiko_group_id": iikoGroupId,
    "active_in_menu": activeInMenu,
    "off_always": offAlways,
    "from_time": fromTime,
    "to_time": toTime,
    "ikpu": ikpu,
    "package_code": packageCode,
    "variant_products": List<dynamic>.from(variantProducts.map((x) => x)),
    "parent_id": parentId,
    "has_modifier": hasModifier,
    "rkeeper_id": rkeeperId,
    "crm_name": crmName,
    "poster_id": posterId,
  };
}

class Brand {
  String id;
  String slug;
  String? image;
  Description title;
  bool active;
  String orderNo;
  String createdAt;
  String shipperId;
  Description? description;
  List<Option>? options;

  Brand({
    required this.id,
    required this.slug,
    this.image,
    required this.title,
    required this.active,
    required this.orderNo,
    required this.createdAt,
    required this.shipperId,
    this.description,
    this.options,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    slug: json["slug"],
    image: json["image"],
    title: Description.fromJson(json["title"]),
    active: json["active"],
    orderNo: json["order_no"],
    createdAt: json["created_at"],
    shipperId: json["shipper_id"],
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    options: json["options"] == null ? [] : List<Option>.from(json["options"]!.map((x) => Option.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "image": image,
    "title": title.toJson(),
    "active": active,
    "order_no": orderNo,
    "created_at": createdAt,
    "shipper_id": shipperId,
    "description": description?.toJson(),
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
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

class Option {
  String id;
  Description title;

  Option({
    required this.id,
    required this.title,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    title: Description.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.toJson(),
  };
}

class Category {
  String id;
  String slug;
  Description title;
  Description description;
  String parentId;
  String image;
  List<dynamic> propertyIds;
  bool active;
  String orderNo;
  String createdAt;
  String shipperId;
  String iikoId;
  String jowiId;

  Category({
    required this.id,
    required this.slug,
    required this.title,
    required this.description,
    required this.parentId,
    required this.image,
    required this.propertyIds,
    required this.active,
    required this.orderNo,
    required this.createdAt,
    required this.shipperId,
    required this.iikoId,
    required this.jowiId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    slug: json["slug"],
    title: Description.fromJson(json["title"]),
    description: Description.fromJson(json["description"]),
    parentId: json["parent_id"],
    image: json["image"],
    propertyIds: List<dynamic>.from(json["property_ids"].map((x) => x)),
    active: json["active"],
    orderNo: json["order_no"],
    createdAt: json["created_at"],
    shipperId: json["shipper_id"],
    iikoId: json["iiko_id"],
    jowiId: json["jowi_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title.toJson(),
    "description": description.toJson(),
    "parent_id": parentId,
    "image": image,
    "property_ids": List<dynamic>.from(propertyIds.map((x) => x)),
    "active": active,
    "order_no": orderNo,
    "created_at": createdAt,
    "shipper_id": shipperId,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
  };
}

class Measurement {
  String id;
  String shipperId;
  String slug;
  Description title;
  String shortName;
  String createdAt;
  double accuracy;
  String code;

  Measurement({
    required this.id,
    required this.shipperId,
    required this.slug,
    required this.title,
    required this.shortName,
    required this.createdAt,
    required this.accuracy,
    required this.code,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    shipperId: json["shipper_id"],
    slug: json["slug"],
    title: Description.fromJson(json["title"]),
    shortName: json["short_name"],
    createdAt: json["created_at"],
    accuracy: json["accuracy"]?.toDouble(),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shipper_id": shipperId,
    "slug": slug,
    "title": title.toJson(),
    "short_name": shortName,
    "created_at": createdAt,
    "accuracy": accuracy,
    "code": code,
  };
}

class Tag {
  String id;
  Description title;
  String icon;
  String slug;
  String shipperId;
  String createdAt;
  String color;

  Tag({
    required this.id,
    required this.title,
    required this.icon,
    required this.slug,
    required this.shipperId,
    required this.createdAt,
    required this.color,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    title: Description.fromJson(json["title"]),
    icon: json["icon"],
    slug: json["slug"],
    shipperId: json["shipper_id"],
    createdAt: json["created_at"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title.toJson(),
    "icon": icon,
    "slug": slug,
    "shipper_id": shipperId,
    "created_at": createdAt,
    "color": color,
  };
}
