

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/product.detail.model.dart';

final productDetailProvider = FutureProvider.family<ProductDetailModel, String>((ref, id) async {
  final service = APIStateNetwork(await createDio());
  final response = await service.getProductDetails(int.parse(id));
  if (response.response.statusCode != 200) {
    Fluttertoast.showToast(msg: "Failed to load product details");
    throw Exception('Failed to load product details');
  }
  return response.data;
});