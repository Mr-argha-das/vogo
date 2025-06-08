import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/socialLogin.model.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart';

class SocialAuth {
  static User? _user;

  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      // Request permission (important on iOS)
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      String? token = await messaging.getToken();
      log('FCM Token: $token');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null; // User cancelled

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userdata = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );
      final service = APIStateNetwork(await createDio());

      final response = await service.socialLogin(
        SocialLoginModelBody(
          socialId: token!,
          socialType: "Google",
          userEmail: userdata.user!.email.toString(),
          deviceToken: "$token",
        ),
      );
      final box = await Hive.openBox('userdata');
      await box.clear();
      await box.put('name', response.data.name);
      await box.put('@id', response.data.userId);
      await box.put('email', response.data.email);
      await box.put('@fcm_token', '$token');
      Fluttertoast.showToast(
        msg: "login success",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 12.0,
      );
      Navigator.pushAndRemoveUntil(
        context,
        CupertinoPageRoute(builder: (context) => BottomNavBar()),
        (route) => false,
      );
    } catch (e) {
      print("Google Sign-In Error: $e");
      Fluttertoast.showToast(
        msg: "Google login faild",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception("faild");
    }
  }

  static Future<void> loginWithFacebook(BuildContext context) async {
    try {
      final LoginResult result =
          await FacebookAuth.instance.login(); // permissions: ['email']

      if (result.status == LoginStatus.success) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.tokenString);

        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          facebookAuthCredential,
        );

        _user = userCredential.user;
        Navigator.pushAndRemoveUntil(
          context,
          CupertinoPageRoute(builder: (context) => BottomNavBar()),
          (route) => false,
        );
      } else {
        log('Facebook login failed: ${result.status}');
        Fluttertoast.showToast(
          msg: "Facebook login failed",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
        throw Exception("faild");
      }
    } catch (e) {
      log('Error during Facebook login: $e');
      Fluttertoast.showToast(
        msg: "Facebook login failed",
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      throw Exception("faild");
    }
  }
}
