import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/cartsList.model.dart';

final cartListProvider = FutureProvider.autoDispose<CartListModel>((ref) async {
  final box = await Hive.openBox('userdata');
  final userId = box.get('@id');
  final service = APIStateNetwork(await createDio());
  final response = await service.getCartList(userId.toString());
  if (response.response.statusCode != 200) {
    Fluttertoast.showToast(msg: "Failed to load cart list");
    throw Exception('Failed to load cart list');
  }
  return response.data;
});
