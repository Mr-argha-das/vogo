

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/orderList.model.dart';

final orderListProvider = FutureProvider<OrderListModel>((ref) async {
  final box = Hive.box('userdata');
  final userid = box.get("@id");
  final service = APIStateNetwork(await createDio());
  return service.fetchOrders(userid);
});