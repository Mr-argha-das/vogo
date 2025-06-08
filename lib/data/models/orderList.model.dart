// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
    bool status;
    int code;
    int total;
    String message;
    List<Datum> data;

    OrderListModel({
        required this.status,
        required this.code,
        required this.total,
        required this.message,
        required this.data,
    });

    factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
        status: json["status"],
        code: json["code"],
        total: json["total"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "total": total,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int orderId;
    String orderDate;
    String orderStatus;
    int totalItem;
    String orderTotal;

    Datum({
        required this.orderId,
        required this.orderDate,
        required this.orderStatus,
        required this.totalItem,
        required this.orderTotal,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        orderId: json["order_id"],
        orderDate: json["order_date"],
        orderStatus: json["order_status"],
        totalItem: json["total_item"],
        orderTotal: json["order_total"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "order_date": orderDate,
        "order_status": orderStatus,
        "total_item": totalItem,
        "order_total": orderTotal,
    };
}
