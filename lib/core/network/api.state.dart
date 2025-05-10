import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vogo/data/models/category.model.dart';
import 'package:vogo/data/models/forgotBodyModel.dart';
import 'package:vogo/data/models/forgotResModel.dart';
import 'package:vogo/data/models/login.body.dart';
import 'package:vogo/data/models/login.response.dart';
import 'package:vogo/data/models/product.model.dart';
import 'package:vogo/data/models/register.req.model.dart';
import 'package:vogo/data/models/register.response.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: 'https://vogo.family/wp-json')
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;
  @POST('/vogofamily/login')
  Future<HttpResponse<LoginResponse>> login(@Body() LoginBody body);
  @POST('/vogofamily/SignUp')
  Future<HttpResponse> register(@Body() RegisterRequest body);
  @GET('/wc/v3/products/categories')
  Future<HttpResponse<List<CategoryResponse>>> getCategory();
  @GET('/wc/v3/products')
  Future<HttpResponse<List<ProductListResponse>>> getProduct();
  @POST('/vogofamily/forgot')
  Future<HttpResponse<ForgotresModel>> forgot(@Body() ForgotbodyModel body);
}
