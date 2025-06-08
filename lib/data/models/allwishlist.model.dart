// To parse this JSON data, do
//
//     final allWishListModel = allWishListModelFromJson(jsonString);

import 'dart:convert';

AllWishListModel allWishListModelFromJson(String str) => AllWishListModel.fromJson(json.decode(str));

String allWishListModelToJson(AllWishListModel data) => json.encode(data.toJson());

class AllWishListModel {
    bool status;
    int code;
    String message;
    String totalRecord;
    List<Datum> data;

    AllWishListModel({
        required this.status,
        required this.code,
        required this.message,
        required this.totalRecord,
        required this.data,
    });

    factory AllWishListModel.fromJson(Map<String, dynamic> json) => AllWishListModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        totalRecord: json["total_record"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "total_record": totalRecord,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    String productId;
    String title;
    String price;
    String regularPrice;
    String currencySymbol;
    String image;

    Datum({
        required this.productId,
        required this.title,
        required this.price,
        required this.regularPrice,
        required this.currencySymbol,
        required this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        productId: json["product_id"],
        title: json["title"],
        price: json["price"],
        regularPrice: json["regular_price"],
        currencySymbol: json["currency_symbol"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "title": title,
        "price": price,
        "regular_price": regularPrice,
        "currency_symbol": currencySymbol,
        "image": image,
    };
}
