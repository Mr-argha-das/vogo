// To parse this JSON data, do
//
//     final chekOutBody = chekOutBodyFromJson(jsonString);

import 'dart:convert';

ChekOutBody chekOutBodyFromJson(String str) => ChekOutBody.fromJson(json.decode(str));

String chekOutBodyToJson(ChekOutBody data) => json.encode(data.toJson());

class ChekOutBody {
    String accessToken;
    String paymentType;

    ChekOutBody({
        required this.accessToken,
        required this.paymentType,
    });

    factory ChekOutBody.fromJson(Map<String, dynamic> json) => ChekOutBody(
        accessToken: json["access_token"],
        paymentType: json["payment_type"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "payment_type": paymentType,
    };
}
