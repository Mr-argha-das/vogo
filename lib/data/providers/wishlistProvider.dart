

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/allwishlist.model.dart';
final wishlistProvider = FutureProvider.autoDispose<AllWishListModel>((ref) async {
  final service = APIStateNetwork(await createDio());
  final box = await Hive.openBox('userdata');
  final userId = box.get("@id");
  final response = await service.getAllWishList(userId);
  if (response.response.statusCode == 200) {
    return response.data;
  } else {
    throw Exception("Something went wrong while fetching wishlist");
  }
});
