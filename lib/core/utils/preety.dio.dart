import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:vogo/core/auth/oauth1_interceptor.dart';

Future<Dio> createDio() async {
  final dio = Dio();
  dio.interceptors.add(
    OAuth1Interceptor(
      consumerKey: 'ck_91e6fa3aac7b5c40ac5a9a1ec0743c0791472e62',
      consumerSecret: 'cs_28bfe71efc2e7f71269236e79d47a896b96305a2',
    ),
  );
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  return dio;
}
