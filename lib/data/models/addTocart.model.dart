// To parse this JSON data, do
//
//     final addTOcartModel = addTOcartModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ffi';

AddTOcartModel addTOcartModelFromJson(String str) => AddTOcartModel.fromJson(json.decode(str));

String addTOcartModelToJson(AddTOcartModel data) => json.encode(data.toJson());

class AddTOcartModel {
    String accessToken;
    String productId;
    int quantity;

    AddTOcartModel({
        required this.accessToken,
        required this.productId,
        required this.quantity,
    });

    factory AddTOcartModel.fromJson(Map<String, dynamic> json) => AddTOcartModel(
        accessToken: json["access_token"],
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "product_id": productId,
        "quantity": quantity,
    };
}
