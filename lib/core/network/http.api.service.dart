import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vogo/core/auth/oauth1_interceptor.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/pruduts.byCategorymodel.dart';

class ApiService {
  final Dio dio;

  ApiService._(this.dio);

  static Future<ApiService> create() async {
    final dio = await createDio();
    dio.interceptors.add(
      OAuth1Interceptor(
        consumerKey: 'ck_91e6fa3aac7b5c40ac5a9a1ec0743c0791472e62',
        consumerSecret: 'cs_28bfe71efc2e7f71269236e79d47a896b96305a2',
      ),
    );
    return ApiService._(dio);
  }

  Future<ProductsByCategoryModel> getProductsByCategory({
    required int categoryId,
    required int perPage,
    required int page,
    String? searchQuery,
  }) async {
    final response = await dio.get(
      'https://vogo.family/wp-json/vogofamily/product-list',
      queryParameters: {
        'category': categoryId,
        'per_page': perPage,
        'page': page,
        if (searchQuery != null && searchQuery.isNotEmpty) 'search': searchQuery,
      },
    );

    log("API response status code: ${response.statusCode}");
    return ProductsByCategoryModel.fromJson(response.data);
  }
}


final apiServiceProvider = FutureProvider<ApiService>((ref) async {
  return await ApiService.create();
});

final productsProvider = StateNotifierProvider.autoDispose
    .family<ProductsNotifier, ProductsByCategoryModel?, int>((ref, categoryId) {
  final apiService = ref.watch(apiServiceProvider).maybeWhen(
        data: (api) => api,
        orElse: () => null,
      );

  return ProductsNotifier(apiService, categoryId);
});

class ProductsNotifier extends StateNotifier<ProductsByCategoryModel?> {
  final ApiService? _apiService;
  final int _categoryId;

  ProductsNotifier(this._apiService, this._categoryId) : super(null) {
    if (_apiService != null) loadInitial();
  }

  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String _searchQuery = '';

  List<Datum> get allProducts => state?.data ?? [];
  bool get hasMore => _hasMore;

  void updateSearchQuery(String query) {
    _searchQuery = query;
    loadInitial();
  }

  void clearData() {
    state = null;
  }

  Future<void> loadInitial() async {
    _currentPage = 1;
    _hasMore = true;
    state = null; // reset
    await loadMore();
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore || _apiService == null) return;

    _isLoading = true;
    try {
      final newData = await _apiService!.getProductsByCategory(
        categoryId: _categoryId,
        perPage: 20,
        page: _currentPage,
        searchQuery: _searchQuery,
      );

      log('Loaded products: ${newData.data.length}');

      if (newData.data.isEmpty) {
        Fluttertoast.showToast(
          msg: "No more products available",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.green,
        );
        _hasMore = false;
      }

      if (_currentPage == 1) {
        state = newData;
      } else {
        final previous = state!;
        state = ProductsByCategoryModel(
          status: newData.status,
          code: newData.code,
          message: newData.message,
          currentPage: newData.currentPage,
          totalCount: newData.totalCount,
          currencyCode: newData.currencyCode,
          currencySymbol: newData.currencySymbol,
          data: [...previous.data, ...newData.data],
        );
      }

      _currentPage++;
    } catch (e, st) {
      log('Error loading products: $e\n$st');
    }

    _isLoading = false;
  }
}
