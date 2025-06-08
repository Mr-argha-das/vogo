// To parse this JSON data, do
//
//     final productsByCategoryModel = productsByCategoryModelFromJson(jsonString);

import 'dart:convert';

ProductsByCategoryModel productsByCategoryModelFromJson(String str) => ProductsByCategoryModel.fromJson(json.decode(str));

String productsByCategoryModelToJson(ProductsByCategoryModel data) => json.encode(data.toJson());

class ProductsByCategoryModel {
    bool status;
    int code;
    String message;
    int currentPage;
    int totalCount;
    String currencyCode;
    String currencySymbol;
    List<Datum> data;

    ProductsByCategoryModel({
        required this.status,
        required this.code,
        required this.message,
        required this.currentPage,
        required this.totalCount,
        required this.currencyCode,
        required this.currencySymbol,
        required this.data,
    });

    factory ProductsByCategoryModel.fromJson(Map<String, dynamic> json) => ProductsByCategoryModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        currentPage: json["currentPage"],
        totalCount: json["total_count"],
        currencyCode: json["currency_code"],
        currencySymbol: json["currency_symbol"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "currentPage": currentPage,
        "total_count": totalCount,
        "currency_code": currencyCode,
        "currency_symbol": currencySymbol,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String slug;
    String price;
    String regularPrice;
    String salePrice;
    String currencySymbol;
    String currencyCode;
    String image;
    List<Category> categories;

    Datum({
        required this.id,
        required this.name,
        required this.slug,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.currencySymbol,
        required this.currencyCode,
        required this.image,
        required this.categories,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        currencySymbol: json["currency_symbol"],
        currencyCode: json["currency_code"],
        image: json["image"],
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "currency_symbol": currencySymbol,
        "currency_code": currencyCode,
        "image": image,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
    };
}

class Category {
    int id;
    String name;

    Category({
        required this.id,
        required this.name,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}
