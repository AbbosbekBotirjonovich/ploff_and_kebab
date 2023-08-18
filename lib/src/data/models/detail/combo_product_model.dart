class ComboProductModel {
  List<Group> groups;
  int count;

  ComboProductModel({
    required this.groups,
    required this.count,
  });

  factory ComboProductModel.fromJson(Map<String, dynamic> json) => ComboProductModel(
    groups: List<Group>.from(json["groups"].map((x) => Group.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "groups": List<dynamic>.from(groups.map((x) => x.toJson())),
    "count": count,
  };
}

class Group {
  String id;
  String comboId;
  String shipperId;
  String slug;
  int order;
  String type;
  dynamic product;
  List<Variant> variants;
  int quantity;
  Title title;

  Group({
    required this.id,
    required this.comboId,
    required this.shipperId,
    required this.slug,
    required this.order,
    required this.type,
    required this.product,
    required this.variants,
    required this.quantity,
    required this.title,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    comboId: json["combo_id"],
    shipperId: json["shipper_id"],
    slug: json["slug"],
    order: json["order"],
    type: json["type"],
    product: json["product"],
    variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    quantity: json["quantity"],
    title: Title.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "combo_id": comboId,
    "shipper_id": shipperId,
    "slug": slug,
    "order": order,
    "type": type,
    "product": product,
    "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    "quantity": quantity,
    "title": title.toJson(),
  };
}

class Title {
  String uz;
  String ru;
  String en;

  Title({
    required this.uz,
    required this.ru,
    required this.en,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
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

class Variant {
  String id;
  String slug;
  Title title;
  String code;
  Title description;
  List<dynamic> categories;
  dynamic brand;
  bool isDivisible;
  String count;
  List<dynamic> tags;
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
  List<dynamic> properties;
  List<ProductProperty> productProperty;
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

  Variant({
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

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    slug: json["slug"],
    title: Title.fromJson(json["title"]),
    code: json["code"],
    description: Title.fromJson(json["description"]),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    brand: json["brand"],
    isDivisible: json["is_divisible"],
    count: json["count"],
    tags: List<dynamic>.from(json["tags"].map((x) => x)),
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
    properties: List<dynamic>.from(json["properties"].map((x) => x)),
    productProperty: List<ProductProperty>.from(json["product_property"].map((x) => ProductProperty.fromJson(x))),
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
    "categories": List<dynamic>.from(categories.map((x) => x)),
    "brand": brand,
    "is_divisible": isDivisible,
    "count": count,
    "tags": List<dynamic>.from(tags.map((x) => x)),
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
    "properties": List<dynamic>.from(properties.map((x) => x)),
    "product_property": List<dynamic>.from(productProperty.map((x) => x.toJson())),
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

class Measurement {
  String id;
  String shipperId;
  String slug;
  Title title;
  String shortName;
  String createdAt;
  int accuracy;
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
    title: Title.fromJson(json["title"]),
    shortName: json["short_name"],
    createdAt: json["created_at"],
    accuracy: json["accuracy"],
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

class ProductProperty {
  String propertyId;
  String optionId;
  dynamic title;

  ProductProperty({
    required this.propertyId,
    required this.optionId,
    required this.title,
  });

  factory ProductProperty.fromJson(Map<String, dynamic> json) => ProductProperty(
    propertyId: json["property_id"],
    optionId: json["option_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "property_id": propertyId,
    "option_id": optionId,
    "title": title,
  };
}
