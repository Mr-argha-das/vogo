import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/login.body.dart';
import 'package:vogo/data/models/login.response.dart';
import 'package:vogo/data/models/register.req.model.dart';
import 'package:vogo/data/models/register.response.dart';

import 'package:vogo/screens/HomeScreen/View/bottombar.dart';

class Auth {
  static Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    // Request permission (important on iOS)
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    String? token = await messaging.getToken();
     log('FCM Token: $token');

    final dio = await createDio();
    final service = APIStateNetwork(dio);
    final response = await service.login(
      LoginBody(email: email, password: password, deviceToken: '$token'),
    );
    
    if (response.response.data['status'] == true) {
      final box = await Hive.openBox('userdata');
      await box.clear();
      LoginResponse userdata = LoginResponse.fromJson(response.response.data);
      await box.put('name', userdata.data.username);
      await box.put('@id', userdata.data.id);
      await box.put('email', userdata.data.email);
      await box.put('@fcm_token', '$token');
      Fluttertoast.showToast(
        msg: response.response.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      log('Login successful: ${response.response.data}');
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const BottomNavBar()),
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(
        msg: response.response.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      throw Exception('Failed to login');
    }
  }

  static Future<void> register(
    String email,
    String password,

    BuildContext context,
  ) async {
    final dio = await createDio();
    final service = APIStateNetwork(dio);
    final response = await service.register(
      RegisterRequest(
        email: email,
        password: password,
        referralCode: "testing",
      ),
    );
    if (response.response.data['status'] == true) {
      final box = await Hive.openBox('userdata');
      await box.clear();
      RegisterResponse data = RegisterResponse.fromJson(response.response.data);
      await box.put('name', data.data.userName);
      await box.put('@id', data.data.userId);
      await box.put('email', data.data.email);
      Fluttertoast.showToast(
        msg: response.response.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      log('Register successful: ${response.response.data}');
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => const BottomNavBar()),
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(
        msg: response.response.data['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      throw Exception('Failed to login');
    }
  }
}
