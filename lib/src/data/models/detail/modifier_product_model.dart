class ModifierProductModel {
  final ProductModifiers? productModifiers;
  final String? count;

  ModifierProductModel({
    this.productModifiers,
    this.count,
  });

  factory ModifierProductModel.fromJson(Map<String, dynamic> json) => ModifierProductModel(
    productModifiers: json["product_modifiers"] == null ? null : ProductModifiers.fromJson(json["product_modifiers"]),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "product_modifiers": productModifiers?.toJson(),
    "count": count,
  };
}

class ProductModifiers {
  final List<Modifier>? singleModifiers;
  final List<Modifier>? groupModifiers;

  ProductModifiers({
    this.singleModifiers,
    this.groupModifiers,
  });

  factory ProductModifiers.fromJson(Map<String, dynamic> json) => ProductModifiers(
    singleModifiers: json["single_modifiers"] == null ? [] : List<Modifier>.from(json["single_modifiers"]!.map((x) => Modifier.fromJson(x))),
    groupModifiers: json["group_modifiers"] == null ? [] : List<Modifier>.from(json["group_modifiers"]!.map((x) => Modifier.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "single_modifiers": singleModifiers == null ? [] : List<dynamic>.from(singleModifiers!.map((x) => x.toJson())),
    "group_modifiers": groupModifiers == null ? [] : List<dynamic>.from(groupModifiers!.map((x) => x.toJson())),
  };
}

class Modifier {
  final String? id;
  final String? type;
  final String? fromProductId;
  final String? toProductId;
  final bool? active;
  final String? order;
  final String? createdAt;
  final String? shipperId;
  final int? minAmount;
  final int? maxAmount;
  final bool? isCompulsory;
  final bool? isCheckbox;
  final bool? addToPrice;
  final CategoryName? name;
  final CategoryName? categoryName;
  final String? price;
  final String? code;
  final List<Variant>? variants;

  Modifier({
    this.id,
    this.type,
    this.fromProductId,
    this.toProductId,
    this.active,
    this.order,
    this.createdAt,
    this.shipperId,
    this.minAmount,
    this.maxAmount,
    this.isCompulsory,
    this.isCheckbox,
    this.addToPrice,
    this.name,
    this.categoryName,
    this.price,
    this.code,
    this.variants,
  });

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
    id: json["id"],
    type: json["type"],
    fromProductId: json["from_product_id"],
    toProductId: json["to_product_id"],
    active: json["active"],
    order: json["order"],
    createdAt: json["created_at"],
    shipperId: json["shipper_id"],
    minAmount: json["min_amount"],
    maxAmount: json["max_amount"],
    isCompulsory: json["is_compulsory"],
    isCheckbox: json["is_checkbox"],
    addToPrice: json["add_to_price"],
    name: json["name"] == null ? null : CategoryName.fromJson(json["name"]),
    categoryName: json["category_name"] == null ? null : CategoryName.fromJson(json["category_name"]),
    price: json["price"],
    code: json["code"],
    variants: json["variants"] == null ? [] : List<Variant>.from(json["variants"]!.map((x) => Variant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "from_product_id": fromProductId,
    "to_product_id": toProductId,
    "active": active,
    "order": order,
    "created_at": createdAt,
    "shipper_id": shipperId,
    "min_amount": minAmount,
    "max_amount": maxAmount,
    "is_compulsory": isCompulsory,
    "is_checkbox": isCheckbox,
    "add_to_price": addToPrice,
    "name": name?.toJson(),
    "category_name": categoryName?.toJson(),
    "price": price,
    "code": code,
    "variants": variants == null ? [] : List<dynamic>.from(variants!.map((x) => x.toJson())),
  };
}

class CategoryName {
  final String? uz;
  final String? ru;
  final String? en;

  CategoryName({
    this.uz,
    this.ru,
    this.en,
  });

  factory CategoryName.fromJson(Map<String, dynamic> json) => CategoryName(
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
  final bool? isDivisible;
  final int? inPrice;
  final int? outPrice;
  final String? currency;
  final String? orderNo;
  final String? count;
  final String? id;
  final String? brandId;
  final String? measurementId;
  final String? rateId;
  final String? image;
  final dynamic categoryIds;
  final dynamic tagIds;
  final dynamic gallery;
  final dynamic propertyGroups;
  final dynamic comboIds;
  final dynamic priceChangerIds;
  final CategoryName? title;
  final CategoryName? description;

  Variant({
    this.isDivisible,
    this.inPrice,
    this.outPrice,
    this.currency,
    this.orderNo,
    this.count,
    this.id,
    this.brandId,
    this.measurementId,
    this.rateId,
    this.image,
    this.categoryIds,
    this.tagIds,
    this.gallery,
    this.propertyGroups,
    this.comboIds,
    this.priceChangerIds,
    this.title,
    this.description,
  });

  factory Variant.fromJson(Map<String, dynamic> json) => Variant(
    isDivisible: json["is_divisible"],
    inPrice: json["in_price"],
    outPrice: json["out_price"],
    currency: json["currency"],
    orderNo: json["order_no"],
    count: json["count"],
    id: json["id"],
    brandId: json["brand_id"],
    measurementId: json["measurement_id"],
    rateId: json["rate_id"],
    image: json["image"],
    categoryIds: json["category_ids"],
    tagIds: json["tag_ids"],
    gallery: json["gallery"],
    propertyGroups: json["property_groups"],
    comboIds: json["combo_ids"],
    priceChangerIds: json["price_changer_ids"],
    title: json["title"] == null ? null : CategoryName.fromJson(json["title"]),
    description: json["description"] == null ? null : CategoryName.fromJson(json["description"]),
  );

  Map<String, dynamic> toJson() => {
    "is_divisible": isDivisible,
    "in_price": inPrice,
    "out_price": outPrice,
    "currency": currency,
    "order_no": orderNo,
    "count": count,
    "id": id,
    "brand_id": brandId,
    "measurement_id": measurementId,
    "rate_id": rateId,
    "image": image,
    "category_ids": categoryIds,
    "tag_ids": tagIds,
    "gallery": gallery,
    "property_groups": propertyGroups,
    "combo_ids": comboIds,
    "price_changer_ids": priceChangerIds,
    "title": title?.toJson(),
    "description": description?.toJson(),
  };
}
