import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/data/models/category.model.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';

class CategoryListNotifier extends StateNotifier<AsyncValue<List<Datum>>> {
  CategoryListNotifier() : super(const AsyncValue.loading()) {
    fetchNextPage();
  }

  int _page = 1;
  final int _perPage = 15;
  bool _isFetching = false;
  bool _hasMore = true;
  final List<Datum> _categories = [];

  Future<void> fetchNextPage() async {
    if (_isFetching || !_hasMore) return;

    _isFetching = true;

    try {
      final dio = await createDio();
      final api = APIStateNetwork(dio);
      final response = await api.getCategory(_perPage, _page);
      final newData = response.data.data;

      if (newData.isEmpty) {
        _hasMore = false;
      } else {
        _categories.addAll(newData);
        _page++;
        state = AsyncValue.data([..._categories]);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    } finally {
      _isFetching = false;
    }
  }

  bool get isFetching => _isFetching;
  bool get hasMore => _hasMore;
}

final categoryListProvider = StateNotifierProvider<CategoryListNotifier, AsyncValue<List<Datum>>>(
  (ref) => CategoryListNotifier(),
);
