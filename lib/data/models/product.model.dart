// To parse this JSON data, do
//
//     final productListResponse = productListResponseFromJson(jsonString);

import 'dart:convert';

List<ProductListResponse> productListResponseFromJson(String str) =>
    List<ProductListResponse>.from(
        json.decode(str).map((x) => ProductListResponse.fromJson(x)));

String productListResponseToJson(List<ProductListResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductListResponse {
  int? id;
  String? name;
  String? slug;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  Type? type;
  Status? status;
  bool? featured;
  CatalogVisibility? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  bool? onSale;
  bool? purchasable;
  int? totalSales;
  bool? virtual;
  bool? downloadable;
  List<Download>? downloads;
  int? downloadLimit;
  int? downloadExpiry;
  String? externalUrl;
  String? buttonText;
  TaxStatus? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  Backorders? backorders;
  bool? backordersAllowed;
  bool? backordered;
  dynamic lowStockAmount;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  int? shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  int? ratingCount;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  int? parentId;
  PurchaseNote? purchaseNote;
  List<Category>? categories;
  List<Category>? tags;
  List<Image>? images;
  List<dynamic>? attributes;
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  List<dynamic>? groupedProducts;
  int? menuOrder;
  String? priceHtml;
  List<int>? relatedIds;
  List<MetaDatum>? metaData;
  StockStatus? stockStatus;
  bool? hasOptions;
  String? postPassword;
  String? globalUniqueId;
  String? yoastHead;
  YoastHeadJson? yoastHeadJson;
  bool? jetpackSharingEnabled;
  Links? links;

  ProductListResponse({
    this.id,
    this.name,
    this.slug,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.lowStockAmount,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.priceHtml,
    this.relatedIds,
    this.metaData,
    this.stockStatus,
    this.hasOptions,
    this.postPassword,
    this.globalUniqueId,
    this.yoastHead,
    this.yoastHeadJson,
    this.jetpackSharingEnabled,
    this.links,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) =>
      ProductListResponse(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.tryParse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.tryParse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.tryParse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.tryParse(json["date_modified_gmt"]),
        type: json["type"] != null ? typeValues.map[json["type"]] : null,
        status: json["status"] != null ? statusValues.map[json["status"]] : null,
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"] != null
            ? catalogVisibilityValues.map[json["catalog_visibility"]]
            : null,
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: json["downloads"] == null
            ? null
            : List<Download>.from(
                json["downloads"].map((x) => Download.fromJson(x))),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"] != null
            ? taxStatusValues.map[json["tax_status"]]
            : null,
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: json["backorders"] != null
            ? backordersValues.map[json["backorders"]]
            : null,
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: json["upsell_ids"] == null
            ? null
            : List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: json["cross_sell_ids"] == null
            ? null
            : List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"] != null
            ? purchaseNoteValues.map[json["purchase_note"]]
            : null,
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        tags: json["tags"] == null
            ? null
            : List<Category>.from(json["tags"].map((x) => Category.fromJson(x))),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : List<dynamic>.from(json["attributes"].map((x) => x)),
        defaultAttributes: json["default_attributes"] == null
            ? null
            : List<dynamic>.from(json["default_attributes"].map((x) => x)),
        variations: json["variations"] == null
            ? null
            : List<dynamic>.from(json["variations"].map((x) => x)),
        groupedProducts: json["grouped_products"] == null
            ? null
            : List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: json["related_ids"] == null
            ? null
            : List<int>.from(json["related_ids"].map((x) => x)),
        metaData: json["meta_data"] == null
            ? null
            : List<MetaDatum>.from(
                json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        stockStatus: json["stock_status"] != null
            ? stockStatusValues.map[json["stock_status"]]
            : null,
        hasOptions: json["has_options"],
        postPassword: json["post_password"],
        globalUniqueId: json["global_unique_id"],
        yoastHead: json["yoast_head"],
        yoastHeadJson: json["yoast_head_json"] == null
            ? null
            : YoastHeadJson.fromJson(json["yoast_head_json"]),
        jetpackSharingEnabled: json["jetpack_sharing_enabled"],
        links:
            json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "permalink": permalink,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "type": type == null ? null : typeValues.reverse[type],
        "status": status == null ? null : statusValues.reverse[status],
        "featured": featured,
        "catalog_visibility": catalogVisibility == null
            ? null
            : catalogVisibilityValues.reverse[catalogVisibility],
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": downloads == null
            ? null
            : List<dynamic>.from(downloads!.map((x) => x.toJson())),
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status":
            taxStatus == null ? null : taxStatusValues.reverse[taxStatus],
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders":
            backorders == null ? null : backordersValues.reverse[backorders],
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "low_stock_amount": lowStockAmount,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions?.toJson(),
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "upsell_ids":
            upsellIds == null ? null : List<dynamic>.from(upsellIds!.map((x) => x)),
        "cross_sell_ids": crossSellIds == null
            ? null
            : List<dynamic>.from(crossSellIds!.map((x) => x)),
        "parent_id": parentId,
        "purchase_note": purchaseNote == null
            ? null
            : purchaseNoteValues.reverse[purchaseNote],
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x.toJson())),
        "tags": tags == null
            ? null
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "images": images == null
            ? null
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "attributes": attributes == null
            ? null
            : List<dynamic>.from(attributes!.map((x) => x)),
        "default_attributes": defaultAttributes == null
            ? null
            : List<dynamic>.from(defaultAttributes!.map((x) => x)),
        "variations": variations == null
            ? null
            : List<dynamic>.from(variations!.map((x) => x)),
        "grouped_products": groupedProducts == null
            ? null
            : List<dynamic>.from(groupedProducts!.map((x) => x)),
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds == null
            ? null
            : List<dynamic>.from(relatedIds!.map((x) => x)),
        "meta_data": metaData == null
            ? null
            : List<dynamic>.from(metaData!.map((x) => x.toJson())),
        "stock_status": stockStatus == null
            ? null
            : stockStatusValues.reverse[stockStatus],
        "has_options": hasOptions,
        "post_password": postPassword,
        "global_unique_id": globalUniqueId,
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson?.toJson(),
        "jetpack_sharing_enabled": jetpackSharingEnabled,
        "_links": links?.toJson(),
      };
}

enum Backorders { NO }

final backordersValues = EnumValues({"no": Backorders.NO});

enum CatalogVisibility { VISIBLE }

final catalogVisibilityValues = EnumValues({"visible": CatalogVisibility.VISIBLE});

class Category {
  int? id;
  String? name;
  String? slug;

  Category({
    this.id,
    this.name,
    this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Dimensions {
  String? length;
  String? width;
  String? height;

  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class Download {
  String? id;
  String? name;
  String? file;

  Download({
    this.id,
    this.name,
    this.file,
  });

  factory Download.fromJson(Map<String, dynamic> json) => Download(
        id: json["id"],
        name: json["name"],
        file: json["file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "file": file,
      };
}

class Image {
  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.tryParse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.tryParse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.tryParse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.tryParse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated?.toIso8601String(),
        "date_created_gmt": dateCreatedGmt?.toIso8601String(),
        "date_modified": dateModified?.toIso8601String(),
        "date_modified_gmt": dateModifiedGmt?.toIso8601String(),
        "src": src,
        "name": name,
        "alt": alt,
      };
}

class Links {
  List<Self>? self;
  List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? null
            : List<Self>.from(json["self"].map((x) => Self.fromJson(x))),
        collection: json["collection"] == null
            ? null
            : List<Collection>.from(
                json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null
            ? null
            : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null
            ? null
            : List<dynamic>.from(collection!.map((x) => x.toJson())),
      };
}

class Collection {
  String? href;

  Collection({
    this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href,
      };
}

class Self {
  String? href;
  TargetHints? targetHints;

  Self({
    this.href,
    this.targetHints,
  });

  factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
        targetHints: json["targetHints"] == null
            ? null
            : TargetHints.fromJson(json["targetHints"]),
      );

  Map<String, dynamic> toJson() => {
        "href": href,
        "targetHints": targetHints?.toJson(),
      };
}

class TargetHints {
  List<Allow>? allow;

  TargetHints({
    this.allow,
  });

  factory TargetHints.fromJson(Map<String, dynamic> json) => TargetHints(
        allow: json["allow"] == null
            ? null
            : List<Allow>.from(
                json["allow"].map((x) => allowValues.map[x] ?? Allow.GET)),
      );

  Map<String, dynamic> toJson() => {
        "allow": allow == null
            ? null
            : List<dynamic>.from(allow!.map((x) => allowValues.reverse[x])),
      };
}

enum Allow { DELETE, GET, PATCH, POST, PUT }

final allowValues = EnumValues({
  "DELETE": Allow.DELETE,
  "GET": Allow.GET,
  "PATCH": Allow.PATCH,
  "POST": Allow.POST,
  "PUT": Allow.PUT
});

class MetaDatum {
  int? id;
  String? key;
  dynamic value;

  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  factory MetaDatum.fromJson(Map<String, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

class ValueValue {
  String? videoType;
  String? uploadVideoId;
  String? uploadVideoUrl;
  String? youtubeUrl;
  String? vimeoUrl;
  String? autoplay;
  String? videoSize;
  String? videoControl;
  String? hideGalleryImg;
  String? hideInformation;
  String? audioStatus;

  ValueValue({
    this.videoType,
    this.uploadVideoId,
    this.uploadVideoUrl,
    this.youtubeUrl,
    this.vimeoUrl,
    this.autoplay,
    this.videoSize,
    this.videoControl,
    this.hideGalleryImg,
    this.hideInformation,
    this.audioStatus,
  });

  factory ValueValue.fromJson(Map<String, dynamic> json) => ValueValue(
        videoType: json["video_type"],
        uploadVideoId: json["upload_video_id"],
        uploadVideoUrl: json["upload_video_url"],
        youtubeUrl: json["youtube_url"],
        vimeoUrl: json["vimeo_url"],
        autoplay: json["autoplay"],
        videoSize: json["video_size"],
        videoControl: json["video_control"],
        hideGalleryImg: json["hide_gallery_img"],
        hideInformation: json["hide_information"],
        audioStatus: json["audio_status"],
      );

  Map<String, dynamic> toJson() => {
        "video_type": videoType,
        "upload_video_id": uploadVideoId,
        "upload_video_url": uploadVideoUrl,
        "youtube_url": youtubeUrl,
        "vimeo_url": vimeoUrl,
        "autoplay": autoplay,
        "video_size": videoSize,
        "video_control": videoControl,
        "hide_gallery_img": hideGalleryImg,
        "hide_information": hideInformation,
        "audio_status": audioStatus,
      };
}

enum PurchaseNote { EMPTY, P_REZERVARE_P }

final purchaseNoteValues = EnumValues({
  "": PurchaseNote.EMPTY,
  "<p>Rezervare</p>\n": PurchaseNote.P_REZERVARE_P
});

enum Status { PUBLISH }

final statusValues = EnumValues({"publish": Status.PUBLISH});

enum StockStatus { INSTOCK }

final stockStatusValues = EnumValues({"instock": StockStatus.INSTOCK});

enum TaxStatus { NONE, TAXABLE }

final taxStatusValues =
    EnumValues({"none": TaxStatus.NONE, "taxable": TaxStatus.TAXABLE});

enum Type { SIMPLE }

final typeValues = EnumValues({"simple": Type.SIMPLE});

class YoastHeadJson {
  String? title;
  String? description;
  Robots? robots;
  String? canonical;
  OgLocale? ogLocale;
  OgType? ogType;
  String? ogTitle;
  String? ogDescription;
  String? ogUrl;
  OgSiteName? ogSiteName;
  DateTime? articleModifiedTime;
  List<OgImage>? ogImage;
  TwitterCard? twitterCard;
  TwitterMisc? twitterMisc;
  Schema? schema;

  YoastHeadJson({
    this.title,
    this.description,
    this.robots,
    this.canonical,
    this.ogLocale,
    this.ogType,
    this.ogTitle,
    this.ogDescription,
    this.ogUrl,
    this.ogSiteName,
    this.articleModifiedTime,
    this.ogImage,
    this.twitterCard,
    this.twitterMisc,
    this.schema,
  });

  factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        description: json["description"],
        robots:
            json["robots"] == null ? null : Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"] != null
            ? ogLocaleValues.map[json["og_locale"]]
            : null,
        ogType:
            json["og_type"] != null ? ogTypeValues.map[json["og_type"]] : null,
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"] != null
            ? ogSiteNameValues.map[json["og_site_name"]]
            : null,
        articleModifiedTime: json["article_modified_time"] == null
            ? null
            : DateTime.tryParse(json["article_modified_time"]),
        ogImage: json["og_image"] == null
            ? null
            : List<OgImage>.from(
                json["og_image"].map((x) => OgImage.fromJson(x))),
        twitterCard: json["twitter_card"] != null
            ? twitterCardValues.map[json["twitter_card"]]
            : null,
        twitterMisc: json["twitter_misc"] == null
            ? null
            : TwitterMisc.fromJson(json["twitter_misc"]),
        schema:
            json["schema"] == null ? null : Schema.fromJson(json["schema"]),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale":
            ogLocale == null ? null : ogLocaleValues.reverse[ogLocale],
        "og_type": ogType == null ? null : ogTypeValues.reverse[ogType],
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName == null
            ? null
            : ogSiteNameValues.reverse[ogSiteName],
        "article_modified_time": articleModifiedTime?.toIso8601String(),
        "og_image": ogImage == null
            ? null
            : List<dynamic>.from(ogImage!.map((x) => x.toJson())),
        "twitter_card": twitterCard == null
            ? null
            : twitterCardValues.reverse[twitterCard],
        "twitter_misc": twitterMisc?.toJson(),
        "schema": schema?.toJson(),
      };
}

class OgImage {
  int? width;
  int? height;
  String? url;
  String? type;

  OgImage({
    this.width,
    this.height,
    this.url,
    this.type,
  });

  factory OgImage.fromJson(Map<String, dynamic> json) => OgImage(
        width: json["width"],
        height: json["height"],
        url: json["url"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "url": url,
        "type": type,
      };
}

enum OgLocale { EN_US }

final ogLocaleValues = EnumValues({"en_US": OgLocale.EN_US});

enum OgSiteName { VOGO_FAMILY }

final ogSiteNameValues = EnumValues({"Vogo Family": OgSiteName.VOGO_FAMILY});

enum OgType { ARTICLE }

final ogTypeValues = EnumValues({"article": OgType.ARTICLE});

class Robots {
  Index? index;
  Follow? follow;
  MaxSnippet? maxSnippet;
  MaxImagePreview? maxImagePreview;
  MaxVideoPreview? maxVideoPreview;

  Robots({
    this.index,
    this.follow,
    this.maxSnippet,
    this.maxImagePreview,
    this.maxVideoPreview,
  });

  factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index:
            json["index"] != null ? indexValues.map[json["index"]] : null,
        follow:
            json["follow"] != null ? followValues.map[json["follow"]] : null,
        maxSnippet: json["max-snippet"] != null
            ? maxSnippetValues.map[json["max-snippet"]]
            : null,
        maxImagePreview: json["max-image-preview"] != null
            ? maxImagePreviewValues.map[json["max-image-preview"]]
            : null,
        maxVideoPreview: json["max-video-preview"] != null
            ? maxVideoPreviewValues.map[json["max-video-preview"]]
            : null,
      );

  Map<String, dynamic> toJson() => {
        "index": index == null ? null : indexValues.reverse[index],
        "follow": follow == null ? null : followValues.reverse[follow],
        "max-snippet":
            maxSnippet == null ? null : maxSnippetValues.reverse[maxSnippet],
        "max-image-preview": maxImagePreview == null
            ? null
            : maxImagePreviewValues.reverse[maxImagePreview],
        "max-video-preview": maxVideoPreview == null
            ? null
            : maxVideoPreviewValues.reverse[maxVideoPreview],
      };
}

enum Follow { FOLLOW }

final followValues = EnumValues({"follow": Follow.FOLLOW});

enum Index { INDEX }

final indexValues = EnumValues({"index": Index.INDEX});

enum MaxImagePreview { MAX_IMAGE_PREVIEW_LARGE }

final maxImagePreviewValues =
    EnumValues({"max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE});

enum MaxSnippet { MAX_SNIPPET_1 }

final maxSnippetValues = EnumValues({"max-snippet:-1": MaxSnippet.MAX_SNIPPET_1});

enum MaxVideoPreview { MAX_VIDEO_PREVIEW_1 }

final maxVideoPreviewValues =
    EnumValues({"max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1});

class Schema {
  String? context;
  List<Graph>? graph;

  Schema({
    this.context,
    this.graph,
  });

  factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: json["@graph"] == null
            ? null
            : List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph == null
            ? null
            : List<dynamic>.from(graph!.map((x) => x.toJson())),
      };
}

class Graph {
  GraphType? type;
  String? id;
  String? url;
  String? name;
  Breadcrumb? isPartOf;
  Breadcrumb? primaryImageOfPage;
  Breadcrumb? image;
  String? thumbnailUrl;
  DateTime? datePublished;
  DateTime? dateModified;
  String? description;
  Breadcrumb? breadcrumb;
  InLanguage? inLanguage;
  List<PotentialAction>? potentialAction;
  String? contentUrl;
  int? width;
  int? height;
  List<ItemListElement>? itemListElement;

  Graph({
    this.type,
    this.id,
    this.url,
    this.name,
    this.isPartOf,
    this.primaryImageOfPage,
    this.image,
    this.thumbnailUrl,
    this.datePublished,
    this.dateModified,
    this.description,
    this.breadcrumb,
    this.inLanguage,
    this.potentialAction,
    this.contentUrl,
    this.width,
    this.height,
    this.itemListElement,
  });

  factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type:
            json["@type"] != null ? graphTypeValues.map[json["@type"]] : null,
        id: json["@id"],
        url: json["url"],
        name: json["name"],
        isPartOf: json["isPartOf"] == null
            ? null
            : Breadcrumb.fromJson(json["isPartOf"]),
        primaryImageOfPage: json["primaryImageOfPage"] == null
            ? null
            : Breadcrumb.fromJson(json["primaryImageOfPage"]),
        image: json["image"] == null
            ? null
            : Breadcrumb.fromJson(json["image"]),
        thumbnailUrl: json["thumbnailUrl"],
        datePublished: json["datePublished"] == null
            ? null
            : DateTime.tryParse(json["datePublished"]),
        dateModified: json["dateModified"] == null
            ? null
            : DateTime.tryParse(json["dateModified"]),
        description: json["description"],
        breadcrumb: json["breadcrumb"] == null
            ? null
            : Breadcrumb.fromJson(json["breadcrumb"]),
        inLanguage: json["inLanguage"] != null
            ? inLanguageValues.map[json["inLanguage"]]
            : null,
        potentialAction: json["potentialAction"] == null
            ? null
            : List<PotentialAction>.from(
                json["potentialAction"].map((x) => PotentialAction.fromJson(x))),
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
        itemListElement: json["itemListElement"] == null
            ? null
            : List<ItemListElement>.from(
                json["itemListElement"].map((x) => ItemListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type == null ? null : graphTypeValues.reverse[type],
        "@id": id,
        "url": url,
        "name": name,
        "isPartOf": isPartOf?.toJson(),
        "primaryImageOfPage": primaryImageOfPage?.toJson(),
        "image": image?.toJson(),
        "thumbnailUrl": thumbnailUrl,
        "datePublished": datePublished?.toIso8601String(),
        "dateModified": dateModified?.toIso8601String(),
        "description": description,
        "breadcrumb": breadcrumb?.toJson(),
        "inLanguage": inLanguage == null
            ? null
            : inLanguageValues.reverse[inLanguage],
        "potentialAction": potentialAction == null
            ? null
            : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "itemListElement": itemListElement == null
            ? null
            : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
      };
}

class Breadcrumb {
  String? id;

  Breadcrumb({
    this.id,
  });

  factory Breadcrumb.fromJson(Map<String, dynamic> json) => Breadcrumb(
        id: json["@id"],
      );

  Map<String, dynamic> toJson() => {
        "@id": id,
      };
}

enum InLanguage { EN_US }

final inLanguageValues = EnumValues({"en-US": InLanguage.EN_US});

class ItemListElement {
  ItemListElementType? type;
  int? position;
  String? name;
  String? item;

  ItemListElement({
    this.type,
    this.position,
    this.name,
    this.item,
  });

  factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: json["@type"] != null
            ? itemListElementTypeValues.map[json["@type"]]
            : null,
        position: json["position"],
        name: json["name"],
        item: json["item"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type == null ? null : itemListElementTypeValues.reverse[type],
        "position": position,
        "name": name,
        "item": item,
      };
}

enum ItemListElementType { LIST_ITEM }

final itemListElementTypeValues =
    EnumValues({"ListItem": ItemListElementType.LIST_ITEM});

class PotentialAction {
  PotentialActionType? type;
  dynamic target;
  QueryInput? queryInput;

  PotentialAction({
    this.type,
    this.target,
    this.queryInput,
  });

  factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: json["@type"] != null
            ? potentialActionTypeValues.map[json["@type"]]
            : null,
        target: json["target"],
        queryInput: json["query-input"] == null
            ? null
            : QueryInput.fromJson(json["query-input"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type == null ? null : potentialActionTypeValues.reverse[type],
        "target": target,
        "query-input": queryInput?.toJson(),
      };
}

class QueryInput {
  QueryInputType? type;
  bool? valueRequired;
  ValueName? valueName;

  QueryInput({
    this.type,
    this.valueRequired,
    this.valueName,
  });

  factory QueryInput.fromJson(Map<String, dynamic> json) => QueryInput(
        type: json["@type"] != null
            ? queryInputTypeValues.map[json["@type"]]
            : null,
        valueRequired: json["valueRequired"],
        valueName: json["valueName"] != null
            ? valueNameValues.map[json["valueName"]]
            : null,
      );

  Map<String, dynamic> toJson() => {
        "@type": type == null ? null : queryInputTypeValues.reverse[type],
        "valueRequired": valueRequired,
        "valueName":
            valueName == null ? null : valueNameValues.reverse[valueName],
      };
}

enum QueryInputType { PROPERTY_VALUE_SPECIFICATION }

final queryInputTypeValues = EnumValues(
    {"PropertyValueSpecification": QueryInputType.PROPERTY_VALUE_SPECIFICATION});

enum ValueName { SEARCH_TERM_STRING }

final valueNameValues =
    EnumValues({"search_term_string": ValueName.SEARCH_TERM_STRING});

class TargetClass {
  TargetType? type;
  UrlTemplate? urlTemplate;

  TargetClass({
    this.type,
    this.urlTemplate,
  });

  factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type:
            json["@type"] != null ? targetTypeValues.map[json["@type"]] : null,
        urlTemplate: json["urlTemplate"] != null
            ? urlTemplateValues.map[json["urlTemplate"]]
            : null,
      );

  Map<String, dynamic> toJson() => {
        "@type": type == null ? null : targetTypeValues.reverse[type],
        "urlTemplate":
            urlTemplate == null ? null : urlTemplateValues.reverse[urlTemplate],
      };
}

enum TargetType { ENTRY_POINT }

final targetTypeValues = EnumValues({"EntryPoint": TargetType.ENTRY_POINT});

enum UrlTemplate { HTTPS_VOGO_FAMILY_S_SEARCH_TERM_STRING }

final urlTemplateValues = EnumValues({
  "https://vogo.family/?s={search_term_string}":
      UrlTemplate.HTTPS_VOGO_FAMILY_S_SEARCH_TERM_STRING
});

enum PotentialActionType { READ_ACTION, SEARCH_ACTION }

final potentialActionTypeValues = EnumValues({
  "ReadAction": PotentialActionType.READ_ACTION,
  "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType { BREADCRUMB_LIST, IMAGE_OBJECT, WEB_PAGE, WEB_SITE }

final graphTypeValues = EnumValues({
  "BreadcrumbList": GraphType.BREADCRUMB_LIST,
  "ImageObject": GraphType.IMAGE_OBJECT,
  "WebPage": GraphType.WEB_PAGE,
  "WebSite": GraphType.WEB_SITE
});

enum TwitterCard { SUMMARY_LARGE_IMAGE }

final twitterCardValues =
    EnumValues({"summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE});

class TwitterMisc {
  String? estReadingTime;

  TwitterMisc({
    this.estReadingTime,
  });

  factory TwitterMisc.fromJson(Map<String, dynamic> json) => TwitterMisc(
        estReadingTime: json["Est. reading time"],
      );

  Map<String, dynamic> toJson() => {
        "Est. reading time": estReadingTime,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}