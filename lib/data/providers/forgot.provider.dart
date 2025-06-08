import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vogo/core/network/api.state.dart';
import 'package:vogo/core/utils/preety.dio.dart';
import 'package:vogo/data/models/forgotBodyModel.dart';
import 'package:vogo/data/models/forgotResModel.dart';

final forgotprovider = FutureProvider.family<ForgotresModel, ForgotbodyModel>((
  ref,
  body,
) async {
  final dio = await createDio();
  final service = APIStateNetwork(dio);
  final response = await service.forgot(body);
  return response.data;
});
