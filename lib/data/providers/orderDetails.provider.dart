

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/orderDetails.model.dart';

final orderDetailsProvider = FutureProvider.family<OrderDetails, String>((ref, userid)async {
 final box = Hive.box("userdata");
 final id = box.get("@id");
 final service = APIStateNetwork(await createDio());
 return await service.fetchOrderDetails(id, userid);
});