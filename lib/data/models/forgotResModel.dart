// To parse this JSON data, do
//
//     final forgotresModel = forgotresModelFromJson(jsonString);

import 'dart:convert';

ForgotresModel forgotresModelFromJson(String str) => ForgotresModel.fromJson(json.decode(str));

String forgotresModelToJson(ForgotresModel data) => json.encode(data.toJson());

class ForgotresModel {
    bool status;
    String message;
    Data data;

    ForgotresModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory ForgotresModel.fromJson(Map<String, dynamic> json) => ForgotresModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    String token;
    String userName;
    String email;

    Data({
        required this.token,
        required this.userName,
        required this.email,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userName: json["user_name"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_name": userName,
        "email": email,
    };
}
