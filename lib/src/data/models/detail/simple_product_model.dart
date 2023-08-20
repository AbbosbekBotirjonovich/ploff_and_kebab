class SimpleProductModel {
  final String? id;
  final String? slug;
  final Description? title;
  final String? code;
  final Description? description;
  final List<Category>? categories;
  final Brand? brand;
  final bool? isDivisible;
  final String? count;
  final List<Tag>? tags;
  final Measurement? measurement;
  final dynamic rate;
  final int? inPrice;
  final int? outPrice;
  final String? image;
  final List<dynamic>? gallery;
  final List<dynamic>? favourites;
  final bool? active;
  final String? order;
  final String? createdAt;
  final String? iikoId;
  final String? jowiId;
  final String? shipperId;
  final List<dynamic>? priceChangers;
  final String? currency;
  final String? type;
  final List<Brand>? properties;
  final List<dynamic>? productProperty;
  final String? iikoSourceActionId;
  final String? iikoGroupId;
  final bool? activeInMenu;
  final bool? offAlways;
  final String? fromTime;
  final String? toTime;
  final String? ikpu;
  final String? packageCode;
  final List<dynamic>? variantProducts;
  final String? parentId;
  final bool? hasModifier;
  final String? rkeeperId;
  final String? crmName;
  final String? posterId;

  SimpleProductModel({
    this.id,
    this.slug,
    this.title,
    this.code,
    this.description,
    this.categories,
    this.brand,
    this.isDivisible,
    this.count,
    this.tags,
    this.measurement,
    this.rate,
    this.inPrice,
    this.outPrice,
    this.image,
    this.gallery,
    this.favourites,
    this.active,
    this.order,
    this.createdAt,
    this.iikoId,
    this.jowiId,
    this.shipperId,
    this.priceChangers,
    this.currency,
    this.type,
    this.properties,
    this.productProperty,
    this.iikoSourceActionId,
    this.iikoGroupId,
    this.activeInMenu,
    this.offAlways,
    this.fromTime,
    this.toTime,
    this.ikpu,
    this.packageCode,
    this.variantProducts,
    this.parentId,
    this.hasModifier,
    this.rkeeperId,
    this.crmName,
    this.posterId,
  });

  factory SimpleProductModel.fromJson(Map<String, dynamic> json) => SimpleProductModel(
    id: json["id"],
    slug: json["slug"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
    code: json["code"],
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
    isDivisible: json["is_divisible"],
    count: json["count"],
    tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    measurement: json["measurement"] == null ? null : Measurement.fromJson(json["measurement"]),
    rate: json["rate"],
    inPrice: json["in_price"],
    outPrice: json["out_price"],
    image: json["image"],
    gallery: json["gallery"] == null ? [] : List<dynamic>.from(json["gallery"]!.map((x) => x)),
    favourites: json["favourites"] == null ? [] : List<dynamic>.from(json["favourites"]!.map((x) => x)),
    active: json["active"],
    order: json["order"],
    createdAt: json["created_at"],
    iikoId: json["iiko_id"],
    jowiId: json["jowi_id"],
    shipperId: json["shipper_id"],
    priceChangers: json["price_changers"] == null ? [] : List<dynamic>.from(json["price_changers"]!.map((x) => x)),
    currency: json["currency"],
    type: json["type"],
    properties: json["properties"] == null ? [] : List<Brand>.from(json["properties"]!.map((x) => Brand.fromJson(x))),
    productProperty: json["product_property"] == null ? [] : List<dynamic>.from(json["product_property"]!.map((x) => x)),
    iikoSourceActionId: json["iiko_source_action_id"],
    iikoGroupId: json["iiko_group_id"],
    activeInMenu: json["active_in_menu"],
    offAlways: json["off_always"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    ikpu: json["ikpu"],
    packageCode: json["package_code"],
    variantProducts: json["variant_products"] == null ? [] : List<dynamic>.from(json["variant_products"]!.map((x) => x)),
    parentId: json["parent_id"],
    hasModifier: json["has_modifier"],
    rkeeperId: json["rkeeper_id"],
    crmName: json["crm_name"],
    posterId: json["poster_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "title": title?.toJson(),
    "code": code,
    "description": description?.toJson(),
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "brand": brand?.toJson(),
    "is_divisible": isDivisible,
    "count": count,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "measurement": measurement?.toJson(),
    "rate": rate,
    "in_price": inPrice,
    "out_price": outPrice,
    "image": image,
    "gallery": gallery == null ? [] : List<dynamic>.from(gallery!.map((x) => x)),
    "favourites": favourites == null ? [] : List<dynamic>.from(favourites!.map((x) => x)),
    "active": active,
    "order": order,
    "created_at": createdAt,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
    "shipper_id": shipperId,
    "price_changers": priceChangers == null ? [] : List<dynamic>.from(priceChangers!.map((x) => x)),
    "currency": currency,
    "type": type,
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
    "product_property": productProperty == null ? [] : List<dynamic>.from(productProperty!.map((x) => x)),
    "iiko_source_action_id": iikoSourceActionId,
    "iiko_group_id": iikoGroupId,
    "active_in_menu": activeInMenu,
    "off_always": offAlways,
    "from_time": fromTime,
    "to_time": toTime,
    "ikpu": ikpu,
    "package_code": packageCode,
    "variant_products": variantProducts == null ? [] : List<dynamic>.from(variantProducts!.map((x) => x)),
    "parent_id": parentId,
    "has_modifier": hasModifier,
    "rkeeper_id": rkeeperId,
    "crm_name": crmName,
    "poster_id": posterId,
  };
}

class Brand {
  final String? id;
  final String? slug;
  final String? image;
  final Description? title;
  final bool? active;
  final String? orderNo;
  final String? createdAt;
  final String? shipperId;
  final Description? description;
  final List<Option>? options;

  Brand({
    this.id,
    this.slug,
    this.image,
    this.title,
    this.active,
    this.orderNo,
    this.createdAt,
    this.shipperId,
    this.description,
    this.options,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
    id: json["id"],
    slug: json["slug"],
    image: json["image"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
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
    "title": title?.toJson(),
    "active": active,
    "order_no": orderNo,
    "created_at": createdAt,
    "shipper_id": shipperId,
    "description": description?.toJson(),
    "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x.toJson())),
  };
}

class Description {
  final String? uz;
  final String? ru;
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

class Option {
  final String? id;
  final Description? title;

  Option({
    this.id,
    this.title,
  });

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    id: json["id"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title?.toJson(),
  };
}

class Category {
  final String? id;
  final String? slug;
  final Description? title;
  final Description? description;
  final String? parentId;
  final String? image;
  final List<dynamic>? propertyIds;
  final bool? active;
  final String? orderNo;
  final String? createdAt;
  final String? shipperId;
  final String? iikoId;
  final String? jowiId;

  Category({
    this.id,
    this.slug,
    this.title,
    this.description,
    this.parentId,
    this.image,
    this.propertyIds,
    this.active,
    this.orderNo,
    this.createdAt,
    this.shipperId,
    this.iikoId,
    this.jowiId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    slug: json["slug"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
    description: json["description"] == null ? null : Description.fromJson(json["description"]),
    parentId: json["parent_id"],
    image: json["image"],
    propertyIds: json["property_ids"] == null ? [] : List<dynamic>.from(json["property_ids"]!.map((x) => x)),
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
    "title": title?.toJson(),
    "description": description?.toJson(),
    "parent_id": parentId,
    "image": image,
    "property_ids": propertyIds == null ? [] : List<dynamic>.from(propertyIds!.map((x) => x)),
    "active": active,
    "order_no": orderNo,
    "created_at": createdAt,
    "shipper_id": shipperId,
    "iiko_id": iikoId,
    "jowi_id": jowiId,
  };
}

class Measurement {
  final String? id;
  final String? shipperId;
  final String? slug;
  final Description? title;
  final String? shortName;
  final String? createdAt;
  final double? accuracy;
  final String? code;

  Measurement({
    this.id,
    this.shipperId,
    this.slug,
    this.title,
    this.shortName,
    this.createdAt,
    this.accuracy,
    this.code,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    shipperId: json["shipper_id"],
    slug: json["slug"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
    shortName: json["short_name"],
    createdAt: json["created_at"],
    accuracy: json["accuracy"]?.toDouble(),
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shipper_id": shipperId,
    "slug": slug,
    "title": title?.toJson(),
    "short_name": shortName,
    "created_at": createdAt,
    "accuracy": accuracy,
    "code": code,
  };
}

class Tag {
  final String? id;
  final Description? title;
  final String? icon;
  final String? slug;
  final String? shipperId;
  final String? createdAt;
  final String? color;

  Tag({
    this.id,
    this.title,
    this.icon,
    this.slug,
    this.shipperId,
    this.createdAt,
    this.color,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    title: json["title"] == null ? null : Description.fromJson(json["title"]),
    icon: json["icon"],
    slug: json["slug"],
    shipperId: json["shipper_id"],
    createdAt: json["created_at"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title?.toJson(),
    "icon": icon,
    "slug": slug,
    "shipper_id": shipperId,
    "created_at": createdAt,
    "color": color,
  };
}
