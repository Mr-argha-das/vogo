// To parse this JSON data, do
//
//     final forgotbodyModel = forgotbodyModelFromJson(jsonString);

import 'dart:convert';

ForgotbodyModel forgotbodyModelFromJson(String str) => ForgotbodyModel.fromJson(json.decode(str));

String forgotbodyModelToJson(ForgotbodyModel data) => json.encode(data.toJson());

class ForgotbodyModel {
    String email;

    ForgotbodyModel({
        required this.email,
    });

    factory ForgotbodyModel.fromJson(Map<String, dynamic> json) => ForgotbodyModel(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
