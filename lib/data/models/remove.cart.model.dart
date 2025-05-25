// To parse this JSON data, do
//
//     final removeCartModel = removeCartModelFromJson(jsonString);

import 'dart:convert';

RemoveCartModel removeCartModelFromJson(String str) => RemoveCartModel.fromJson(json.decode(str));

String removeCartModelToJson(RemoveCartModel data) => json.encode(data.toJson());

class RemoveCartModel {
    String accessToken;
    String productId;
    String cartKey;

    RemoveCartModel({
        required this.accessToken,
        required this.productId,
        required this.cartKey,
    });

    factory RemoveCartModel.fromJson(Map<String, dynamic> json) => RemoveCartModel(
        accessToken: json["access_token"],
        productId: json["product_id"],
        cartKey: json["cart_key"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "product_id": productId,
        "cart_key": cartKey,
    };
}
