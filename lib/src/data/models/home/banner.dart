class BannerModel {
    List<BannerElement> banners;
    String count;

    BannerModel({
        required this.banners,
        required this.count,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        banners: List<BannerElement>.from(json["banners"].map((x) => BannerElement.fromJson(x))),
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "count": count,
    };
}

class BannerElement {
    String id;
    Title title;
    String position;
    String image;
    String url;
    bool active;
    String createdAt;
    String updatedAt;
    String shipperId;
    String about;

    BannerElement({
        required this.id,
        required this.title,
        required this.position,
        required this.image,
        required this.url,
        required this.active,
        required this.createdAt,
        required this.updatedAt,
        required this.shipperId,
        required this.about,
    });

    factory BannerElement.fromJson(Map<String, dynamic> json) => BannerElement(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        position: json["position"],
        image: json["image"],
        url: json["url"],
        active: json["active"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        shipperId: json["shipper_id"],
        about: json["about"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "position": position,
        "image": image,
        "url": url,
        "active": active,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "shipper_id": shipperId,
        "about": about,
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
