// To parse this JSON data, do
//
//     final addressListModel = addressListModelFromJson(jsonString);

import 'dart:convert';

AddressListModel addressListModelFromJson(String str) => AddressListModel.fromJson(json.decode(str));

String addressListModelToJson(AddressListModel data) => json.encode(data.toJson());

class AddressListModel {
    bool status;
    int code;
    String message;
    List<AdressData> data;

    AddressListModel({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
    });

    factory AddressListModel.fromJson(Map<String, dynamic> json) => AddressListModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<AdressData>.from(json["data"].map((x) => AdressData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class AdressData {
    String firstName;
    String lastName;
    String company;
    String address1;
    String address2;
    String city;
    String state;
    String stateName;
    String postcode;
    String country;
    String countryName;
    String phone;
    String email;
    String dialCode;
    String type;

    AdressData({
        required this.firstName,
        required this.lastName,
        required this.company,
        required this.address1,
        required this.address2,
        required this.city,
        required this.state,
        required this.stateName,
        required this.postcode,
        required this.country,
        required this.countryName,
        required this.phone,
        required this.email,
        required this.dialCode,
        required this.type,
    });

    factory AdressData.fromJson(Map<String, dynamic> json) => AdressData(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        stateName: json["state_name"],
        postcode: json["postcode"],
        country: json["country"],
        countryName: json["country_name"],
        phone: json["phone"],
        email: json["email"],
        dialCode: json["dialCode"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "state_name": stateName,
        "postcode": postcode,
        "country": country,
        "country_name": countryName,
        "phone": phone,
        "email": email,
        "dialCode": dialCode,
        "type": type,
    };
}
