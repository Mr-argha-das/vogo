// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

List<CategoryResponse> categoryResponseFromJson(String str) => List<CategoryResponse>.from(json.decode(str).map((x) => CategoryResponse.fromJson(x)));

String categoryResponseToJson(List<CategoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponse {
    int? id; // Made nullable
    String? name; // Made nullable
    String? slug; // Made nullable
    int? parent; // Made nullable
    Description? description; // Made nullable
    Display? display; // Made nullable
    Image? image;
    int? menuOrder; // Made nullable
    int? count; // Made nullable
    String? yoastHead; // Made nullable
    YoastHeadJson? yoastHeadJson; // Made nullable
    Links? links; // Made nullable

    CategoryResponse({
        this.id,
        this.name,
        this.slug,
        this.parent,
        this.description,
        this.display,
        this.image,
        this.menuOrder,
        this.count,
        this.yoastHead,
        this.yoastHeadJson,
        this.links,
    });

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        parent: json["parent"],
        description: json["description"] != null ? descriptionValues.map[json["description"]] : null,
        display: json["display"] != null ? displayValues.map[json["display"]] : null,
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        menuOrder: json["menu_order"],
        count: json["count"],
        yoastHead: json["yoast_head"],
        yoastHeadJson: json["yoast_head_json"] == null ? null : YoastHeadJson.fromJson(json["yoast_head_json"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "parent": parent,
        "description": description == null ? null : descriptionValues.reverse[description],
        "display": display == null ? null : displayValues.reverse[display],
        "image": image?.toJson(),
        "menu_order": menuOrder,
        "count": count,
        "yoast_head": yoastHead,
        "yoast_head_json": yoastHeadJson?.toJson(),
        "_links": links?.toJson(),
    };
}

enum Description {
    EMPTY,
    KIDS_MARKET,
    VEGAN_FIT_SPORT
}

final descriptionValues = EnumValues({
    "": Description.EMPTY,
    "Kids Market": Description.KIDS_MARKET,
    "VEGAN-FIT-SPORT": Description.VEGAN_FIT_SPORT
});

enum Display {
    BOTH,
    DEFAULT
}

final displayValues = EnumValues({
    "both": Display.BOTH,
    "default": Display.DEFAULT
});

class Image {
    int? id; // Made nullable
    DateTime? dateCreated; // Made nullable
    DateTime? dateCreatedGmt; // Made nullable
    DateTime? dateModified; // Made nullable
    DateTime? dateModifiedGmt; // Made nullable
    String? src; // Made nullable
    String? name; // Made nullable
    String? alt; // Made nullable

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
        dateCreated: json["date_created"] == null ? null : DateTime.tryParse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null ? null : DateTime.tryParse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null ? null : DateTime.tryParse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null ? null : DateTime.tryParse(json["date_modified_gmt"]),
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
    List<Self>? self; // Made nullable
    List<Collection>? collection; // Made nullable
    List<Collection>? up;

    Links({
        this.self,
        this.collection,
        this.up,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : List<Self>.from(json["self"].map((x) => Self.fromJson(x))),
        collection: json["collection"] == null ? null : List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
        up: json["up"] == null ? null : List<Collection>.from(json["up"].map((x) => Collection.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": self == null ? null : List<dynamic>.from(self!.map((x) => x.toJson())),
        "collection": collection == null ? null : List<dynamic>.from(collection!.map((x) => x.toJson())),
        " W": up == null ? null : List<dynamic>.from(up!.map((x) => x.toJson())),
    };
}

class Collection {
    String? href; // Made nullable

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
    String? href; // Made nullable
    TargetHints? targetHints; // Made nullable

    Self({
        this.href,
        this.targetHints,
    });

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        href: json["href"],
        targetHints: json["targetHints"] == null ? null : TargetHints.fromJson(json["targetHints"]),
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "targetHints": targetHints?.toJson(),
    };
}

class TargetHints {
    List<Allow>? allow; // Made nullable

    TargetHints({
        this.allow,
    });

    factory TargetHints.fromJson(Map<String, dynamic> json) => TargetHints(
        allow: json["allow"] == null ? null : List<Allow>.from(json["allow"].map((x) => allowValues.map[x] ?? Allow.GET)),
    );

    Map<String, dynamic> toJson() => {
        "allow": allow == null ? null : List<dynamic>.from(allow!.map((x) => allowValues.reverse[x])),
    };
}

enum Allow {
    DELETE,
    GET,
    PATCH,
    POST,
    PUT
}

final allowValues = EnumValues({
    "DELETE": Allow.DELETE,
    "GET": Allow.GET,
    "PATCH": Allow.PATCH,
    "POST": Allow.POST,
    "PUT": Allow.PUT
});

class YoastHeadJson {
    String? title; // Made nullable
    Robots? robots; // Made nullable
    String? canonical; // Made nullable
    OgLocale? ogLocale; // Made nullable
    OgType? ogType; // Made nullable
    String? ogTitle; // Made nullable
    String? ogUrl; // Made nullable
    OgSiteName? ogSiteName; // Made nullable
    TwitterCard? twitterCard; // Made nullable
    Schema? schema; // Made nullable
    String? ogDescription;
    String? description;

    YoastHeadJson({
        this.title,
        this.robots,
        this.canonical,
        this.ogLocale,
        this.ogType,
        this.ogTitle,
        this.ogUrl,
        this.ogSiteName,
        this.twitterCard,
        this.schema,
        this.ogDescription,
        this.description,
    });

    factory YoastHeadJson.fromJson(Map<String, dynamic> json) => YoastHeadJson(
        title: json["title"],
        robots: json["robots"] == null ? null : Robots.fromJson(json["robots"]),
        canonical: json["canonical"],
        ogLocale: json["og_locale"] != null ? ogLocaleValues.map[json["og_locale"]] : null,
        ogType: json["og_type"] != null ? ogTypeValues.map[json["og_type"]] : null,
        ogTitle: json["og_title"],
        ogUrl: json["og_url"],
        ogSiteName: json["og_site_name"] != null ? ogSiteNameValues.map[json["og_site_name"]] : null,
        twitterCard: json["twitter_card"] != null ? twitterCardValues.map[json["twitter_card"]] : null,
        schema: json["schema"] == null ? null : Schema.fromJson(json["schema"]),
        ogDescription: json["og_description"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "robots": robots?.toJson(),
        "canonical": canonical,
        "og_locale": ogLocale == null ? null : ogLocaleValues.reverse[ogLocale],
        "og_type": ogType == null ? null : ogTypeValues.reverse[ogType],
        "og_title": ogTitle,
        "og_url": ogUrl,
        "og_site_name": ogSiteName == null ? null : ogSiteNameValues.reverse[ogSiteName],
        "twitter_card": twitterCard == null ? null : twitterCardValues.reverse[twitterCard],
        "schema": schema?.toJson(),
        "og_description": ogDescription,
        "description": description,
    };
}

enum OgLocale {
    EN_US
}

final ogLocaleValues = EnumValues({
    "en_US": OgLocale.EN_US
});

enum OgSiteName {
    VOGO_FAMILY
}

final ogSiteNameValues = EnumValues({
    "Vogo Family": OgSiteName.VOGO_FAMILY
});

enum OgType {
    ARTICLE
}

final ogTypeValues = EnumValues({
    "article": OgType.ARTICLE
});

class Robots {
    Index? index; // Made nullable
    Follow? follow; // Made nullable
    MaxSnippet? maxSnippet; // Made nullable
    MaxImagePreview? maxImagePreview; // Made nullable
    MaxVideoPreview? maxVideoPreview; // Made nullable

    Robots({
        this.index,
        this.follow,
        this.maxSnippet,
        this.maxImagePreview,
        this.maxVideoPreview,
    });

    factory Robots.fromJson(Map<String, dynamic> json) => Robots(
        index: json["index"] != null ? indexValues.map[json["index"]] : null,
        follow: json["follow"] != null ? followValues.map[json["follow"]] : null,
        maxSnippet: json["max-snippet"] != null ? maxSnippetValues.map[json["max-snippet"]] : null,
        maxImagePreview: json["max-image-preview"] != null ? maxImagePreviewValues.map[json["max-image-preview"]] : null,
        maxVideoPreview: json["max-video-preview"] != null ? maxVideoPreviewValues.map[json["max-video-preview"]] : null,
    );

    Map<String, dynamic> toJson() => {
        "index": index == null ? null : indexValues.reverse[index],
        "follow": follow == null ? null : followValues.reverse[follow],
        "max-snippet": maxSnippet == null ? null : maxSnippetValues.reverse[maxSnippet],
        "max-image-preview": maxImagePreview == null ? null : maxImagePreviewValues.reverse[maxImagePreview],
        "max-video-preview": maxVideoPreview == null ? null : maxVideoPreviewValues.reverse[maxVideoPreview],
    };
}

enum Follow {
    FOLLOW
}

final followValues = EnumValues({
    "follow": Follow.FOLLOW
});

enum Index {
    INDEX
}

final indexValues = EnumValues({
    "index": Index.INDEX
});

enum MaxImagePreview {
    MAX_IMAGE_PREVIEW_LARGE
}

final maxImagePreviewValues = EnumValues({
    "max-image-preview:large": MaxImagePreview.MAX_IMAGE_PREVIEW_LARGE
});

enum MaxSnippet {
    MAX_SNIPPET_1
}

final maxSnippetValues = EnumValues({
    "max-snippet:-1": MaxSnippet.MAX_SNIPPET_1
});

enum MaxVideoPreview {
    MAX_VIDEO_PREVIEW_1
}

final maxVideoPreviewValues = EnumValues({
    "max-video-preview:-1": MaxVideoPreview.MAX_VIDEO_PREVIEW_1
});

class Schema {
    String? context; // Made nullable
    List<Graph>? graph; // Made nullable

    Schema({
        this.context,
        this.graph,
    });

    factory Schema.fromJson(Map<String, dynamic> json) => Schema(
        context: json["@context"],
        graph: json["@graph"] == null ? null : List<Graph>.from(json["@graph"].map((x) => Graph.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@context": context,
        "@graph": graph == null ? null : List<dynamic>.from(graph!.map((x) => x.toJson())),
    };
}

class Graph {
    GraphType? type; // Made nullable
    String? id; // Made nullable
    String? url;
    String? name;
    Breadcrumb? isPartOf;
    Breadcrumb? breadcrumb;
    InLanguage? inLanguage;
    List<ItemListElement>? itemListElement;
    String? description;
    List<PotentialAction>? potentialAction;

    Graph({
        this.type,
        this.id,
        this.url,
        this.name,
        this.isPartOf,
        this.breadcrumb,
        this.inLanguage,
        this.itemListElement,
        this.description,
        this.potentialAction,
    });

    factory Graph.fromJson(Map<String, dynamic> json) => Graph(
        type: json["@type"] != null ? graphTypeValues.map[json["@type"]] : null,
        id: json["@id"],
        url: json["url"],
        name: json["name"],
        isPartOf: json["isPartOf"] == null ? null : Breadcrumb.fromJson(json["isPartOf"]),
        breadcrumb: json["breadcrumb"] == null ? null : Breadcrumb.fromJson(json["breadcrumb"]),
        inLanguage: json["inLanguage"] != null ? inLanguageValues.map[json["inLanguage"]] : null,
        itemListElement: json["itemListElement"] == null ? null : List<ItemListElement>.from(json["itemListElement"].map((x) => ItemListElement.fromJson(x))),
        description: json["description"],
        potentialAction: json["potentialAction"] == null ? null : List<PotentialAction>.from(json["potentialAction"].map((x) => PotentialAction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "@type": type == null ? null : graphTypeValues.reverse[type],
        "@id": id,
        "url": url,
        "name": name,
        "isPartOf": isPartOf?.toJson(),
        "breadcrumb": breadcrumb?.toJson(),
        "inLanguage": inLanguage == null ? null : inLanguageValues.reverse[inLanguage],
        "itemListElement": itemListElement == null ? null : List<dynamic>.from(itemListElement!.map((x) => x.toJson())),
        "description": description,
        "potentialAction": potentialAction == null ? null : List<dynamic>.from(potentialAction!.map((x) => x.toJson())),
    };
}

class Breadcrumb {
    String? id; // Made nullable

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

enum InLanguage {
    EN_US
}

final inLanguageValues = EnumValues({
    "en-US": InLanguage.EN_US
});

class ItemListElement {
    ItemListElementType? type; // Made nullable
    int? position; // Made nullable
    String? name; // Made nullable
    String? item;

    ItemListElement({
        this.type,
        this.position,
        this.name,
        this.item,
    });

    factory ItemListElement.fromJson(Map<String, dynamic> json) => ItemListElement(
        type: json["@type"] != null ? itemListElementTypeValues.map[json["@type"]] : null,
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

enum ItemListElementType {
    LIST_ITEM
}

final itemListElementTypeValues = EnumValues({
    "ListItem": ItemListElementType.LIST_ITEM
});

class PotentialAction {
    PotentialActionType? type; // Made nullable
    Target? target; // Made nullable
    QueryInput? queryInput; // Made nullable

    PotentialAction({
        this.type,
        this.target,
        this.queryInput,
    });

    factory PotentialAction.fromJson(Map<String, dynamic> json) => PotentialAction(
        type: json["@type"] != null ? potentialActionTypeValues.map[json["@type"]] : null,
        target: json["target"] == null ? null : Target.fromJson(json["target"]),
        queryInput: json["query-input"] == null ? null : QueryInput.fromJson(json["query-input"]),
    );

    Map<String, dynamic> toJson() => {
        "@type": type == null ? null : potentialActionTypeValues.reverse[type],
        "target": target?.toJson(),
        "query-input": queryInput?.toJson(),
    };
}

class QueryInput {
    QueryInputType? type; // Made nullable
    bool? valueRequired; // Made nullable
    ValueName? valueName; // Made nullable

    QueryInput({
        this.type,
        this.valueRequired,
        this.valueName,
    });

    factory QueryInput.fromJson(Map<String, dynamic> json) => QueryInput(
        type: json["@type"] != null ? queryInputTypeValues.map[json["@type"]] : null,
        valueRequired: json["valueRequired"],
        valueName: json["valueName"] != null ? valueNameValues.map[json["valueName"]] : null,
    );

    Map<String, dynamic> toJson() => {
        "@type": type == null ? null : queryInputTypeValues.reverse[type],
        "valueRequired": valueRequired,
        "valueName": valueName == null ? null : valueNameValues.reverse[valueName],
    };
}

enum QueryInputType {
    PROPERTY_VALUE_SPECIFICATION
}

final queryInputTypeValues = EnumValues({
    "PropertyValueSpecification": QueryInputType.PROPERTY_VALUE_SPECIFICATION
});

enum ValueName {
    SEARCH_TERM_STRING
}

final valueNameValues = EnumValues({
    "search_term_string": ValueName.SEARCH_TERM_STRING
});

class Target {
    TargetType? type; // Made nullable
    UrlTemplate? urlTemplate; // Made nullable

    Target({
        this.type,
        this.urlTemplate,
    });

    factory Target.fromJson(Map<String, dynamic> json) => Target(
        type: json["@type"] != null ? targetTypeValues.map[json["@type"]] : null,
        urlTemplate: json["urlTemplate"] != null ? urlTemplateValues.map[json["urlTemplate"]] : null,
    );

    Map<String, dynamic> toJson() => {
        "@type": type == null ? null : targetTypeValues.reverse[type],
        "urlTemplate": urlTemplate == null ? null : urlTemplateValues.reverse[urlTemplate],
    };
}

enum TargetType {
    ENTRY_POINT
}

final targetTypeValues = EnumValues({
    "EntryPoint": TargetType.ENTRY_POINT
});

enum UrlTemplate {
    HTTPS_VOGO_FAMILY_S_SEARCH_TERM_STRING
}

final urlTemplateValues = EnumValues({
    "https://vogo.family/?s={search_term_string}": UrlTemplate.HTTPS_VOGO_FAMILY_S_SEARCH_TERM_STRING
});

enum PotentialActionType {
    SEARCH_ACTION
}

final potentialActionTypeValues = EnumValues({
    "SearchAction": PotentialActionType.SEARCH_ACTION
});

enum GraphType {
    BREADCRUMB_LIST,
    COLLECTION_PAGE,
    WEB_SITE
}

final graphTypeValues = EnumValues({
    "BreadcrumbList": GraphType.BREADCRUMB_LIST,
    "CollectionPage": GraphType.COLLECTION_PAGE,
    "WebSite": GraphType.WEB_SITE
});

enum TwitterCard {
    SUMMARY_LARGE_IMAGE
}

final twitterCardValues = EnumValues({
    "summary_large_image": TwitterCard.SUMMARY_LARGE_IMAGE
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