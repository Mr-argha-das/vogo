// To parse this JSON data, do
//
//     final updateCartModel = updateCartModelFromJson(jsonString);

import 'dart:convert';

UpdateCartModel updateCartModelFromJson(String str) => UpdateCartModel.fromJson(json.decode(str));

String updateCartModelToJson(UpdateCartModel data) => json.encode(data.toJson());

class UpdateCartModel {
    String accessToken;
    String productId;
    String cartKey;
    int quantity;

    UpdateCartModel({
        required this.accessToken,
        required this.productId,
        required this.cartKey,
        required this.quantity,
    });

    factory UpdateCartModel.fromJson(Map<String, dynamic> json) => UpdateCartModel(
        accessToken: json["access_token"],
        productId: json["product_id"],
        cartKey: json["cart_key"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "product_id": productId,
        "cart_key": cartKey,
        "quantity": quantity,
    };
}
