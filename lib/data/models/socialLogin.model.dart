// To parse this JSON data, do
//
//     final socialLoginModelBody = socialLoginModelBodyFromJson(jsonString);

import 'dart:convert';

SocialLoginModelBody socialLoginModelBodyFromJson(String str) => SocialLoginModelBody.fromJson(json.decode(str));

String socialLoginModelBodyToJson(SocialLoginModelBody data) => json.encode(data.toJson());

class SocialLoginModelBody {
    String socialId;
    String socialType;
    String userEmail;
    String deviceToken;

    SocialLoginModelBody({
        required this.socialId,
        required this.socialType,
        required this.userEmail,
        required this.deviceToken,
    });

    factory SocialLoginModelBody.fromJson(Map<String, dynamic> json) => SocialLoginModelBody(
        socialId: json["social_id"],
        socialType: json["social_type"],
        userEmail: json["user_email"],
        deviceToken: json["device_token"],
    );

    Map<String, dynamic> toJson() => {
        "social_id": socialId,
        "social_type": socialType,
        "user_email": userEmail,
        "device_token": deviceToken,
    };
}
