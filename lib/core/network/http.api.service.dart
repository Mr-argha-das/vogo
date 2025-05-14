import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/core/auth/oauth1_interceptor.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/pruduts.byCategorymodel.dart';

class ApiService {
  final Dio dio;

  ApiService._(this.dio);

  static Future<ApiService> create() async {
    final dio = await createDio(); // Your pretty dio setup
    dio.interceptors.add(
      OAuth1Interceptor(
        consumerKey: 'ck_91e6fa3aac7b5c40ac5a9a1ec0743c0791472e62',
        consumerSecret: 'cs_28bfe71efc2e7f71269236e79d47a896b96305a2',
      ),
    );
    return ApiService._(dio);
  }

  Future<List<ProductsByCategoryModel>> getProductsByCategory({
    required int categoryId,
    required int perPage,
    required int page,
    String? searchQuery,
  }) async {
    final response = await dio.get(
      'https://vogo.family/wp-json/wc/v3/products',
      queryParameters: {
        'categories': categoryId,
        'per_page': perPage,
        'page': page,
        if (searchQuery != null && searchQuery.isNotEmpty)
          'search': searchQuery,
      },
    );

    final data = response.data;
    return (data as List)
        .map((json) => ProductsByCategoryModel.fromJson(json))
        .toList();
  }
}

final apiServiceProvider = FutureProvider<ApiService>((ref) async {
  return await ApiService.create();
});

final productsProvider = StateNotifierProvider.autoDispose
    .family<ProductsNotifier, List<ProductsByCategoryModel>, int>((
      ref,
      categoryId,
    ) {
      final apiService = ref
          .watch(apiServiceProvider)
          .maybeWhen(data: (api) => api, orElse: () => null);

      return ProductsNotifier(apiService, categoryId);
    });

class ProductsNotifier extends StateNotifier<List<ProductsByCategoryModel>> {
  final ApiService? _apiService;
  final int _categoryId;

  ProductsNotifier(this._apiService, this._categoryId) : super([]) {
    if (_apiService != null) loadInitial();
  }

  int _currentPage = 1;
  bool _isLoading = false;
  bool _hasMore = true;
  String _searchQuery = '';

  int get currentPage => _currentPage;
  bool get hasMore => _hasMore;
  String get searchQuery => _searchQuery;

  // To update the search query
  void updateSearchQuery(String query) {
    _searchQuery = query;
    loadInitial(); // Reload the products based on new search query
  }

  Future<void> loadInitial() async {
    _currentPage = 1;
    _hasMore = true;
    state = []; // Reset the products list
    await loadMore();
  }

  Future<void> loadMore() async {
    if (_isLoading || !_hasMore || _apiService == null) return;

    _isLoading = true;
    final newProducts = await _apiService!.getProductsByCategory(
      categoryId: _categoryId,
      perPage: 30,
      page: _currentPage,
      searchQuery: _searchQuery, // Pass the search query to the API
    );

    if (newProducts.isEmpty) {
      _hasMore = false;
    } else {
      state = [...state, ...newProducts];
      _currentPage++;
    }

    _isLoading = false;
  }
}

class ProductsQuery {
  final int categoryId;
  final String search;

  ProductsQuery({required this.categoryId, this.search = ''});

  ProductsQuery copyWith({int? categoryId, String? search}) {
    return ProductsQuery(
      categoryId: categoryId ?? this.categoryId,
      search: search ?? this.search,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductsQuery &&
          runtimeType == other.runtimeType &&
          categoryId == other.categoryId &&
          search == other.search;

  @override
  int get hashCode => categoryId.hashCode ^ search.hashCode;
}
