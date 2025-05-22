// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) => CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) => json.encode(data.toJson());

class CategoryResponse {
    bool status;
    int code;
    String message;
    List<Datum> data;
    int currentPage;
    int perPage;
    int totalPages;
    String totalItems;

    CategoryResponse({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
        required this.currentPage,
        required this.perPage,
        required this.totalPages,
        required this.totalItems,
    });

    factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        currentPage: json["current_page"],
        perPage: json["per_page"],
        totalPages: json["total_pages"],
        totalItems: json["total_items"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "current_page": currentPage,
        "per_page": perPage,
        "total_pages": totalPages,
        "total_items": totalItems,
    };
}

class Datum {
    int id;
    String name;
    String slug;
    String description;
    String image;
    bool hasChildren;

    Datum({
        required this.id,
        required this.name,
        required this.slug,
        required this.description,
        required this.image,
        required this.hasChildren,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        image: json["image"],
        hasChildren: json["has_children"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "image": image,
        "has_children": hasChildren,
    };
}
