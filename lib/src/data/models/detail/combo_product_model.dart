class ComboProductModel {
  final List<Group>? groups;
  final int? count;

  ComboProductModel({
    this.groups,
    this.count,
  });

  factory ComboProductModel.fromJson(Map<String, dynamic> json) => ComboProductModel(
    groups: json["groups"] == null ? [] : List<Group>.from(json["groups"]!.map((x) => Group.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "groups": groups == null ? [] : List<dynamic>.from(groups!.map((x) => x.toJson())),
    "count": count,
  };
}

class Group {
  final String? id;
  final String? comboId;
  final String? shipperId;
  final String? slug;
  final int? order;
  final String? type;
  final dynamic product;
  final List<Variant>? variants;
  final int? quantity;
  final Title? title;

  Group({
    this.id,
    this.comboId,
    this.shipperId,
    this.slug,
    this.order,
    this.type,
    this.product,
    this.variants,
    this.quantity,
    this.title,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
    id: json["id"],
    comboId: json["combo_id"],
    shipperId: json["shipper_id"],
    slug: json["slug"],
    order: json["order"],
    type: json["type"],
    product: json["product"],
    variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
    quantity: json["quantity"],
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "combo_id": comboId,
    "shipper_id": shipperId,
    "slug": slug,
    "order": order,
    "type": type,
    "product": product,
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
    "quantity": quantity,
    "title": title?.toJson(),
  };
}

class Title {
  final String? uz;
  final String? ru;
  final String? en;

  Title({
    this.uz,
    this.ru,
    this.en,
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
  final String? id;
  final String? slug;
  final Title? title;
  final String? code;
  final Title? description;
  final List<dynamic>? categories;
  final dynamic brand;
  final bool? isDivisible;
  final String? count;
  final List<dynamic>? tags;
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
  final List<dynamic>? properties;
  final List<ProductProperty>? productProperty;
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

  Variant({
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

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    id: json["id"],
    slug: json["slug"],
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
    code: json["code"],
    description: json["description"] == null ? null : Title.fromJson(json["description"]),
    categories: json["categories"] == null ? [] : List<dynamic>.from(json["categories"]!.map((x) => x)),
    brand: json["brand"],
    isDivisible: json["is_divisible"],
    count: json["count"],
    tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
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
    properties: json["properties"] == null ? [] : List<dynamic>.from(json["properties"]!.map((x) => x)),
    productProperty: json["product_property"] == null ? [] : List<ProductProperty>.from(json["product_property"]!.map((x) => ProductProperty.fromJson(x))),
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
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x)),
    "brand": brand,
    "is_divisible": isDivisible,
    "count": count,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
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
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x)),
    "product_property": productProperty == null ? [] : List<dynamic>.from(productProperty!.map((x) => x.toJson())),
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

class Measurement {
  final String? id;
  final String? shipperId;
  final String? slug;
  final Title? title;
  final String? shortName;
  final String? createdAt;
  final int? accuracy;
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
    title: json["title"] == null ? null : Title.fromJson(json["title"]),
    shortName: json["short_name"],
    createdAt: json["created_at"],
    accuracy: json["accuracy"],
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

class ProductProperty {
  final String? propertyId;
  final String? optionId;
  final dynamic title;

  ProductProperty({
    this.propertyId,
    this.optionId,
    this.title,
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
