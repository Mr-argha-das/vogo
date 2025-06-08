// To parse this JSON data, do
//
//     final addressAddModel = addressAddModelFromJson(jsonString);

import 'dart:convert';

AddressAddModel addressAddModelFromJson(String str) => AddressAddModel.fromJson(json.decode(str));

String addressAddModelToJson(AddressAddModel data) => json.encode(data.toJson());

class AddressAddModel {
    String accessToken;
    String addressType;
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
    bool sameAsBilling;

    AddressAddModel({
        required this.accessToken,
        required this.addressType,
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
        required this.sameAsBilling,
    });

    factory AddressAddModel.fromJson(Map<String, dynamic> json) => AddressAddModel(
        accessToken: json["access_token"],
        addressType: json["address_type"],
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
        sameAsBilling: json["same_as_billing"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "address_type": addressType,
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
        "same_as_billing": sameAsBilling,
    };
}
