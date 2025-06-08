// To parse this JSON data, do
//
//     final orderDetails = orderDetailsFromJson(jsonString);

import 'dart:convert';

OrderDetails orderDetailsFromJson(String str) => OrderDetails.fromJson(json.decode(str));

String orderDetailsToJson(OrderDetails data) => json.encode(data.toJson());

class OrderDetails {
    bool status;
    int code;
    String message;
    Data data;

    OrderDetails({
        required this.status,
        required this.code,
        required this.message,
        required this.data,
    });

    factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
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
    int orderId;
    String orderDate;
    String orderStatus;
    int totalItem;
    int orderSubtotal;
    String shippingTotal;
    String vat;
    int totalDiscount;
    String paymentMethod;
    String orderTotal;
    BillingAddress billingAddress;
    List<Item> items;

    Data({
        required this.orderId,
        required this.orderDate,
        required this.orderStatus,
        required this.totalItem,
        required this.orderSubtotal,
        required this.shippingTotal,
        required this.vat,
        required this.totalDiscount,
        required this.paymentMethod,
        required this.orderTotal,
        required this.billingAddress,
        required this.items,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        orderId: json["order_id"],
        orderDate: json["order_date"],
        orderStatus: json["order_status"],
        totalItem: json["total_item"],
        orderSubtotal: json["order_subtotal"],
        shippingTotal: json["shipping_total"],
        vat: json["vat"],
        totalDiscount: json["total_discount"],
        paymentMethod: json["payment_method"],
        orderTotal: json["order_total"],
        billingAddress: BillingAddress.fromJson(json["billing_address"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_date": orderDate,
        "order_status": orderStatus,
        "total_item": totalItem,
        "order_subtotal": orderSubtotal,
        "shipping_total": shippingTotal,
        "vat": vat,
        "total_discount": totalDiscount,
        "payment_method": paymentMethod,
        "order_total": orderTotal,
        "billing_address": billingAddress.toJson(),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
    };
}

class BillingAddress {
    String firstName;
    String lastName;
    String company;
    String address1;
    String address2;
    String city;
    String state;
    String postcode;
    String country;
    String email;
    String phone;

    BillingAddress({
        required this.firstName,
        required this.lastName,
        required this.company,
        required this.address1,
        required this.address2,
        required this.city,
        required this.state,
        required this.postcode,
        required this.country,
        required this.email,
        required this.phone,
    });

    factory BillingAddress.fromJson(Map<String, dynamic> json) => BillingAddress(
        firstName: json["first_name"],
        lastName: json["last_name"],
        company: json["company"],
        address1: json["address_1"],
        address2: json["address_2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "address_1": address1,
        "address_2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "email": email,
        "phone": phone,
    };
}

class Item {
    int productId;
    int variationId;
    String productTitle;
    int quantity;
    String itemSubtotal;
    String itemTotal;

    Item({
        required this.productId,
        required this.variationId,
        required this.productTitle,
        required this.quantity,
        required this.itemSubtotal,
        required this.itemTotal,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        variationId: json["variation_id"],
        productTitle: json["product_title"],
        quantity: json["quantity"],
        itemSubtotal: json["item_subtotal"],
        itemTotal: json["item_total"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "variation_id": variationId,
        "product_title": productTitle,
        "quantity": quantity,
        "item_subtotal": itemSubtotal,
        "item_total": itemTotal,
    };
}
