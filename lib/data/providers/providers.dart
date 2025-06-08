import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/core/network/api.state.dart';

import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/pruduts.byCategorymodel.dart';
import 'package:vogo/data/providers/product_notifier.dart';

final dioProvider = FutureProvider<Dio>((ref) async {
  return await createDio();
});

final apiServiceProvider = FutureProvider<APIStateNetwork>((ref) async {
  final dio = await ref.watch(dioProvider.future);
  return APIStateNetwork(dio);
});

final productNotifierProvider = AsyncNotifierProvider.family<
  ProductNotifier,
  List<ProductsByCategoryModel>,
  int
>(ProductNotifier.new);
