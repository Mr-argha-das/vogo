

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/addressList.model.dart';

final addressProviderList = FutureProvider<AddressListModel>((ref)async{
  final box = Hive.box('userdata');
  final userId = box.get('@id');
  final service = APIStateNetwork(await createDio());
  final response = await service.getAddress(userId);
  return AddressListModel.fromJson(response.response.data);
});