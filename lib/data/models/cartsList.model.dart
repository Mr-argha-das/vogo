// To parse this JSON data, do
//
//     final cartListModel = cartListModelFromJson(jsonString);

import 'dart:convert';

CartListModel cartListModelFromJson(String str) => CartListModel.fromJson(json.decode(str));

String cartListModelToJson(CartListModel data) => json.encode(data.toJson());

class CartListModel {
    bool status;
    int code;
    String message;
    List<Datum> data;
    String cartSubtotal;
    String shippingTotal;
    String appliedCoupons;
    int discountAmount;
    String savedAmount;
    String vat;
    String cartTotal;
    int totalCartQty;

    CartListModel({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
        required this.cartSubtotal,
        required this.shippingTotal,
        required this.appliedCoupons,
        required this.discountAmount,
        required this.savedAmount,
        required this.vat,
        required this.cartTotal,
        required this.totalCartQty,
    });

    factory CartListModel.fromJson(Map<String, dynamic> json) => CartListModel(
        status: json["status"],
        code: json["code"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        cartSubtotal: json["cart_subtotal"],
        shippingTotal: json["shipping_total"],
        appliedCoupons: json["applied_coupons"],
        discountAmount: json["discount_amount"],
        savedAmount: json["saved_amount"],
        vat: json["vat"],
        cartTotal: json["cart_total"],
        totalCartQty: json["total_cart_qty"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "cart_subtotal": cartSubtotal,
        "shipping_total": shippingTotal,
        "applied_coupons": appliedCoupons,
        "discount_amount": discountAmount,
        "saved_amount": savedAmount,
        "vat": vat,
        "cart_total": cartTotal,
        "total_cart_qty": totalCartQty,
    };
}

class Datum {
    String title;
    String cartKey;
    int productId;
    int variationId;
    int productCartQuantity;
    String price;
    String regularPrice;
    String salePrice;
    String image;

    Datum({
        required this.title,
        required this.cartKey,
        required this.productId,
        required this.variationId,
        required this.productCartQuantity,
        required this.price,
        required this.regularPrice,
        required this.salePrice,
        required this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        cartKey: json["cart_key"],
        productId: json["product_id"],
        variationId: json["variation_id"],
        productCartQuantity: json["product_cart_quantity"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "cart_key": cartKey,
        "product_id": productId,
        "variation_id": variationId,
        "product_cart_quantity": productCartQuantity,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "image": image,
    };
}
