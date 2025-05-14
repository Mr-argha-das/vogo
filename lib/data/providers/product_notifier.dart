import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/data/models/pruduts.byCategorymodel.dart';
import 'package:vogo/data/providers/providers.dart';

class ProductNotifier
    extends FamilyAsyncNotifier<List<ProductsByCategoryModel>, int> {
  late APIStateNetwork _apiService;
  late final int _categoryId;

  String? _searchQuery;
  int _currentPage = 1;
  bool _hasMore = true;
  final int _perPage = 15;

  @override
  FutureOr<List<ProductsByCategoryModel>> build(int categoryId) async {
    _categoryId = categoryId;

    final dio = await ref.watch(dioProvider.future);
    _apiService = APIStateNetwork(dio);

    return await _fetchProducts(reset: true);
  }

  Future<List<ProductsByCategoryModel>> _fetchProducts({
    bool reset = false,
  }) async {
    if (reset) {
      _currentPage = 1;
      _hasMore = true;
    }

    if (!_hasMore) return state.value ?? [];

    try {
      final newProducts = await _apiService.getProductsByCategory(
        _categoryId,
        _perPage,
        _currentPage,
        _searchQuery,
      );

      final productList = newProducts.cast<ProductsByCategoryModel>();

      _hasMore = productList.length == _perPage;
      _currentPage++;

      final currentList = reset ? [] : state.value ?? [];
      final updatedList = [...currentList, ...productList];

      state = AsyncValue.data([...currentList, ...productList]);
      return [...currentList, ...productList];
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }

  Future<void> loadProducts() async => await _fetchProducts();

  Future<void> refresh() async => await _fetchProducts(reset: true);

  Future<void> updateSearchQuery(String query) async {
    _searchQuery = query.isEmpty ? null : query;
    await refresh();
  }
}

final productNotifierProvider = AsyncNotifierProvider.family<
  ProductNotifier,
  List<ProductsByCategoryModel>,
  int
>(ProductNotifier.new);
