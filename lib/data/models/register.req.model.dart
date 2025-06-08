// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest registerRequestFromJson(String str) => RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest data) => json.encode(data.toJson());

class RegisterRequest {
    String email;
    String password;
    String referralCode;

    RegisterRequest({
        required this.email,
        required this.password,
        required this.referralCode,
    });

    factory RegisterRequest.fromJson(Map<String, dynamic> json) => RegisterRequest(
        email: json["email"],
        password: json["password"],
        referralCode: json["referral_code"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "referral_code": referralCode,
    };
}
