import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';

final productProvider = FutureProvider((ref) async {
  final dio = await createDio();
  final service = APIStateNetwork(dio);
  final response = await service.getProduct();
  return response.data;
});
