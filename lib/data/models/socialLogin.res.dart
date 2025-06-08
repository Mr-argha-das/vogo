// To parse this JSON data, do
//
//     final socialLoginResponsemodel = socialLoginResponsemodelFromJson(jsonString);

import 'dart:convert';

SocialLoginResponsemodel socialLoginResponsemodelFromJson(String str) => SocialLoginResponsemodel.fromJson(json.decode(str));

String socialLoginResponsemodelToJson(SocialLoginResponsemodel data) => json.encode(data.toJson());

class SocialLoginResponsemodel {
    bool status;
    int code;
    String message;
    Data data;

    SocialLoginResponsemodel({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
    });

    factory SocialLoginResponsemodel.fromJson(Map<String, dynamic> json) => SocialLoginResponsemodel(
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
    String token;
    String userId;
    String userName;
    String email;
    String name;
    String socialType;
    String socialId;

    Data({
        required this.token,
        required this.userId,
        required this.userName,
        required this.email,
        required this.name,
        required this.socialType,
        required this.socialId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        userId: json["user_id"],
        userName: json["user_name"],
        email: json["email"],
        name: json["name"],
        socialType: json["social_type"],
        socialId: json["social_id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "user_id": userId,
        "user_name": userName,
        "email": email,
        "name": name,
        "social_type": socialType,
        "social_id": socialId,
    };
}
