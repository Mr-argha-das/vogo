import 'package:flutter_riverpod/flutter_riverpod.dart' show FutureProvider;
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/category.model.dart';

final categorsysProvider = FutureProvider<List<CategoryResponse>>((ref) async {
  final apistate = APIStateNetwork(await createDio());
  final response = await apistate.getCategory();
  return response.data;
});
