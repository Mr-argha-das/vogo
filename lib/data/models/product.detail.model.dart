import 'dart:convert';

ProductDetailModel? productDetailModelFromJson(String str) => ProductDetailModel.fromJson(json.decode(str));

String productDetailModelToJson(ProductDetailModel? data) => json.encode(data?.toJson());

class ProductDetailModel {
    int? id;
    String? name;
    String? slug;
    String? permalink;
    DateTime? dateCreated;
    DateTime? dateCreatedGmt;
    DateTime? dateModified;
    DateTime? dateModifiedGmt;
    String? type;
    String? status;
    bool? featured;
    String? catalogVisibility;
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
    List<dynamic>? downloads;
    int? downloadLimit;
    int? downloadExpiry;
    String? externalUrl;
    String? buttonText;
    String? taxStatus;
    String? taxClass;
    bool? manageStock;
    dynamic stockQuantity;
    String? backorders;
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
    String? purchaseNote;
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
    String? stockStatus;
    bool? hasOptions;
    String? postPassword;
    String? globalUniqueId;
    String? yoastHead;
    YoastHeadJson? yoastHeadJson;
    bool? jetpackSharingEnabled;
    Links? links;

    ProductDetailModel({
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

    factory ProductDetailModel.fromJson(Map<String, dynamic> json) => ProductDetailModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] != null ? DateTime.parse(json["date_created"]) : null,
        dateCreatedGmt: json["date_created_gmt"] != null ? DateTime.parse(json["date_created_gmt"]) : null,
        dateModified: json["date_modified"] != null ? DateTime.parse(json["date_modified"]) : null,
        dateModifiedGmt: json["date_modified_gmt"] != null ? DateTime.parse(json["date_modified_gmt"]) : null,
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
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
        downloads: json["downloads"] != null ? List<dynamic>.from(json["downloads"].map((x) => x)) : null,
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        lowStockAmount: json["low_stock_amount"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: json["dimensions"] != null ? Dimensions.fromJson(json["dimensions"]) : null,
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        upsellIds: json["upsell_ids"] != null ? List<dynamic>.from(json["upsell_ids"].map((x) => x)) : null,
        crossSellIds: json["cross_sell_ids"] != null ? List<dynamic>.from(json["cross_sell_ids"].map((x) => x)) : null,
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: json["categories"] != null ? List<Category>.from(json["categories"].map((x) => Category.fromJson(x))) : null,
        tags: json["tags"] != null ? List<Category>.from(json["tags"].map((x) => Category.fromJson(x))) : null,
        images: json["images"] != null ? List<Image>.from(json["images"].map((x) => Image.fromJson(x))) : null,
        attributes: json["attributes"] != null ? List<dynamic>.from(json["attributes"].map((x) => x)) : null,
        defaultAttributes: json["default_attributes"] != null ? List<dynamic>.from(json["default_attributes"].map((x) => x)) : null,
        variations: json["variations"] != null ? List<dynamic>.from(json["variations"].map((x) => x)) : null,
        groupedProducts: json["grouped_products"] != null ? List<dynamic>.from(json["grouped_products"].map((x) => x)) : null,
        menuOrder: json["menu_order"],
        priceHtml: json["price_html"],
        relatedIds: json["related_ids"] != null ? List<int>.from(json["related_ids"].map((x) => x)) : null,
        metaData: json["meta_data"] != null ? List<MetaDatum>.from(json["meta_data"].map((x) => MetaDatum.fromJson(x))) : null,
        stockStatus: json["stock_status"],
        hasOptions: json["has_options"],
        postPassword: json["post_password"],
        globalUniqueId: json["global_unique_id"],
        yoastHead: json["yoast_head"],
        yoastHeadJson: json["yoast_head_json"] != null ? YoastHeadJson.fromJson(json["yoast_head_json"]) : null,
        jetpackSharingEnabled: json["jetpack_sharing_enabled"],
        links: json["_links"] != null ? Links.fromJson(json["_links"]) : null,
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
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
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
        "downloads": downloads != null ? List<dynamic>.from(downloads!.map((x) => x)) : null,
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "backorders": backorders,
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
        "upsell_ids": upsellIds != null ? List<dynamic>.from(upsellIds!.map((x) => x)) : null,
        "cross_sell_ids": crossSellIds != null ? List<dynamic>.from(crossSellIds!.map((x) => x)) : null,
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": categories != null ? List<dynamic>.from(categories!.map((x) => x.toJson())) : null,
        "tags": tags != null ? List<dynamic>.from(tags!.map((x) => x.toJson())) : null,
        "images": images != null ? List<dynamic>.from(images!.map((x) => x.toJson())) : null,
        "attributes": attributes != null ? List<dynamic>.from(attributes!.map((x) => x)) : null,
        "default_attributes": defaultAttributes != null ? List<dynamic>.from(defaultAttributes!.map((x) => x)) : null,
        "variations": variations != null ? List<dynamic>.from(variations!.map((x) => x)) : null,
        "grouped_products": groupedProducts != null ? List<dynamic>.from(groupedProducts!.map((x) => x)) : null,
        "menu_order": menuOrder,
        "price_html": priceHtml,
        "related_ids": relatedIds != null ? List<dynamic>.from(relatedIds!.map((x) => x)) : null,
        "meta_data": metaData != null ? List<dynamic>.from(metaData!.map((x) => x.toJson())) : null,
        "stock_status": stockStatus,
        "has_options": hasOptions,
        "post_password": postPassword,
        "global_unique_id": globalUniqueId,
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson?.toJson(),
        "jetpack_sharing_enabled": jetpackSharingEnabled,
        "_links": links?.toJson(),
    };
}

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
        dateCreated: json["date_created"] != null ? DateTime.parse(json["date_created"]) : null,
        dateCreatedGmt: json["date_created_gmt"] != null ? DateTime.parse(json["date_created_gmt"]) : null,
        dateModified: json["date_modified"] != null ? DateTime.parse(json["date_modified"]) : null,
        dateModifiedGmt: json["date_modified_gmt"] != null ? DateTime.parse(json["date_modified_gmt"]) : null,
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
        self: json["self"] != null ? List<Self>.from(json["self"].map((x) => Self.fromJson(x))) : null,
        collection: json["collection"] != null ? List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))) : null,
    );

    Map<String, dynamic> toJson() => {
        "self": self != null ? List<dynamic>.from(self!.map((x) => x.toJson())) : null,
        "collection": collection != null ? List<dynamic>.from(collection!.map((x) => x.toJson())) : null,
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
        targetHints: json["targetHints"] != null ? TargetHints.fromJson(json["targetHints"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "targetHints": targetHints?.toJson(),
    };
}

class TargetHints {
    List<String>? allow;

    TargetHints({
        this.allow,
    });

    factory TargetHints.fromJson(Map<String, dynamic> json) => TargetHints(
        allow: json["allow"] != null ? List<String>.from(json["allow"].map((x) => x)) : null,
    );

    Map<String, dynamic> toJson() => {
        "allow": allow != null ? List<dynamic>.from(allow!.map((x) => x)) : null,
    };
}

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

class ValueClass {
    The33838? the33838;

    ValueClass({
        this.the33838,
    });

    factory ValueClass.fromJson(Map<String, dynamic> json) => ValueClass(
        the33838: json["33838"] != null ? The33838.fromJson(json["33838"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "33838": the33838?.toJson(),
    };
}

class The33838 {
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

    The33838({
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

    factory The33838.fromJson(Map<String, dynamic> json) => The33838(
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

class YoastHeadJson {
    String? title;
    String? description;
    Robots? robots;
    String? canonical;
    String? ogLocale;
    String? ogType;
    String? ogTitle;
    String? ogDescription;
    String? ogUrl;
    String? ogSiteName;
    DateTime? articleModifiedTime;
    List<OgImage>? ogImage;
    String? twitterCard;
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
        robots: json["robots"] != null ? Robots.fromJson(json["robots"]) : null,
        canonical: json["canonical"],
        ogLocale: json["og_locale"],
        ogType: json["og_type"],
        ogTitle: json["og_title"],
        ogDescription: json["og_description"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"],
        articleModifiedTime: json["article_modified_time"] != null ? DateTime.parse(json["article_modified_time"]) : null,
        ogImage: json["og_image"] != null ? List<OgImage>.from(json["og_image"].map((x) => OgImage.fromJson(x))) : null,
        twitterCard: json["twitter_card"],
        twitterMisc: json["twitter_misc"] != null ? TwitterMisc.fromJson(json["twitter_misc"]) : null,
        schema: json["schema"] != null ? Schema.fromJson(json["schema"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale,
        "og_type": ogType,
        "og_title": ogTitle,
        "og_description": ogDescription,
        "og_url": ogUrl,
        "og_site_name": ogSiteName,
        "article_modified_time": articleModifiedTime?.toIso8601String(),
        "og_image": ogImage != null ? List<dynamic>.from(ogImage!.map((x) => x.toJson())) : null,
        "twitter_card": twitterCard,
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

class Robots {
    String? index;
    String? follow;
    String? maxSnippet;
    String? maxImagePreview;
    String? maxVideoPreview;

    Robots({
        this.index,
        this.follow,
        this.maxSnippet,
        this.maxImagePreview,
        this.maxVideoPreview,
    });

    factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"],
        follow: json["follow"],
        maxSnippet: json["max-snippet"],
        maxImagePreview: json["max-image-preview"],
        maxVideoPreview: json["max-video-preview"],
    );

    Map<String, dynamic> toJson() => {
        "index": index,
        "follow": follow,
        "max-snippet": maxSnippet,
        "max-image-preview": maxImagePreview,
        "max-video-preview": maxVideoPreview,
    };
}

class Schema {
    String? context;
    List<Graph>? graph;

    Schema({
        this.context,
        this.graph,
    });

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: json["@graph"] != null ? List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))) : null,
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph != null ? List<dynamic>.from(graph!.map((x) => x.toJson())) : null,
    };
}

class Graph {
    String? type;
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
    String? inLanguage;
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
        type: json["@type"],
        id: json["@id"],
        url: json["url"],
        name: json["name"],
        isPartOf: json["isPartOf"] != null ? Breadcrumb.fromJson(json["isPartOf"]) : null,
        primaryImageOfPage: json["primaryImageOfPage"] != null ? Breadcrumb.fromJson(json["primaryImageOfPage"]) : null,
        image: json["image"] != null ? Breadcrumb.fromJson(json["image"]) : null,
        thumbnailUrl: json["thumbnailUrl"],
        datePublished: json["datePublished"] != null ? DateTime.parse(json["datePublished"]) : null,
        dateModified: json["dateModified"] != null ? DateTime.parse(json["dateModified"]) : null,
        description: json["description"],
        breadcrumb: json["breadcrumb"] != null ? Breadcrumb.fromJson(json["breadcrumb"]) : null,
        inLanguage: json["inLanguage"],
        potentialAction: json["potentialAction"] != null ? List<PotentialAction>.from(json["potentialAction"]!.map((x) => PotentialAction.fromJson(x))) : null,
        contentUrl: json["contentUrl"],
        width: json["width"],
        height: json["height"],
        itemListElement: json["itemListElement"] != null ? List<ItemListElement>.from(json["itemListElement"]!.map((x) => ItemListElement.fromJson(x))) : null,
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
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
        "inLanguage": inLanguage,
        "potentialAction": potentialAction != null ? List<dynamic>.from(potentialAction!.map((x) => x.toJson())) : null,
        "contentUrl": contentUrl,
        "width": width,
        "height": height,
        "itemListElement": itemListElement != null ? List<dynamic>.from(itemListElement!.map((x) => x.toJson())) : null,
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

class ItemListElement {
    String? type;
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
        type: json["@type"],
        position: json["position"],
        name: json["name"],
        item: json["item"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "position": position,
        "name": name,
        "item": item,
    };
}

class PotentialAction {
    String? type;
    dynamic target;
    QueryInput? queryInput;

    PotentialAction({
        this.type,
        this.target,
        this.queryInput,
    });

    factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: json["@type"],
        target: json["target"],
        queryInput: json["query-input"] != null ? QueryInput.fromJson(json["query-input"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "target": target,
        "query-input": queryInput?.toJson(),
    };
}

class QueryInput {
    String? type;
    bool? valueRequired;
    String? valueName;

    QueryInput({
        this.type,
        this.valueRequired,
        this.valueName,
    });

    factory QueryInput.fromJson(Map<String, dynamic> json) => QueryInput(
        type: json["@type"],
        valueRequired: json["valueRequired"],
        valueName: json["valueName"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "valueRequired": valueRequired,
        "valueName": valueName,
    };
}

class TargetClass {
    String? type;
    String? urlTemplate;

    TargetClass({
        this.type,
        this.urlTemplate,
    });

    factory TargetClass.fromJson(Map<String, dynamic> json) => TargetClass(
        type: json["@type"],
        urlTemplate: json["urlTemplate"],
    );

    Map<String, dynamic> toJson() => {
        "@type": type,
        "urlTemplate": urlTemplate,
    };
}

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