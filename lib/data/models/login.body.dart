// To parse this JSON data, do
//
//     final loginBody = loginBodyFromJson(jsonString);

import 'dart:convert';

LoginBody loginBodyFromJson(String str) => LoginBody.fromJson(json.decode(str));

String loginBodyToJson(LoginBody data) => json.encode(data.toJson());

class LoginBody {
    String email;
    String password;
    String deviceToken;

    LoginBody({
        required this.email,
        required this.password,
        required this.deviceToken,
    });

    factory LoginBody.fromJson(Map<String, dynamic> json) => LoginBody(
        email: json["email"],
        password: json["password"],
        deviceToken: json["device_token"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "device_token": deviceToken,
    };
}
