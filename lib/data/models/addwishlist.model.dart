// To parse this JSON data, do
//
//     final addWishListBody = addWishListBodyFromJson(jsonString);

import 'dart:convert';

AddWishListBody addWishListBodyFromJson(String str) => AddWishListBody.fromJson(json.decode(str));

String addWishListBodyToJson(AddWishListBody data) => json.encode(data.toJson());

class AddWishListBody {
    String accessToken;
    String productId;

    AddWishListBody({
        required this.accessToken,
        required this.productId,
    });

    factory AddWishListBody.fromJson(Map<String, dynamic> json) => AddWishListBody(
        accessToken: json["access_token"],
        productId: json["product_id"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "product_id": productId,
    };
}


AddWishListResponse addWishListResponseFromJson(String str) => AddWishListResponse.fromJson(json.decode(str));

String addWishListResponseToJson(AddWishListResponse data) => json.encode(data.toJson());

class AddWishListResponse {
    bool status;
    int code;
    String message;
    Data data;

    AddWishListResponse({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
    });

    factory AddWishListResponse.fromJson(Map<String, dynamic> json) => AddWishListResponse(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    int productId;

    Data({
        required this.productId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
    };
}
