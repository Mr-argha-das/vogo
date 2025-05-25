import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:vogo/data/models/addTocart.model.dart';
import 'package:vogo/data/models/cartsList.model.dart';
import 'package:vogo/data/models/category.model.dart';
import 'package:vogo/data/models/login.body.dart';
import 'package:vogo/data/models/product.detail.model.dart';
import 'package:vogo/data/models/product.model.dart';
import 'package:vogo/data/models/pruduts.byCategorymodel.dart';
import 'package:vogo/data/models/register.req.model.dart';
import 'package:vogo/data/models/remove.cart.model.dart';
import 'package:vogo/data/models/update.cartmodel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: 'https://vogo.family/wp-json')
abstract class APIStateNetwork {
  factory APIStateNetwork(Dio dio, {String baseUrl}) = _APIStateNetwork;
  @POST('/vogofamily/login')
  Future<HttpResponse> login(@Body() LoginBody body);
  @POST('/vogofamily/SignUp')
  Future<HttpResponse> register(@Body() RegisterRequest body);
  @GET('/vogofamily/category-list')
  Future<HttpResponse<CategoryResponse>> getCategory(
    @Query("per_page") int perPage,
    @Query("page") int page,
    // Optional search parameter
  );
  @GET('/wc/v3/products')
  Future<HttpResponse<List<ProductListResponse>>> getProduct();
  @GET("/wc/v3/products")
  Future<List<ProductsByCategoryModel>> getProductsByCategory(
    @Query("category") int categoryId,
    @Query("per_page") int perPage,
    @Query("page") int page,

    @Query("search") String? searchQuery, // Optional search parameter
  );
  //Product details
  @GET('/wc/v3/products/{id}')
  Future<HttpResponse<ProductDetailModel>> getProductDetails(
    @Path("id") int id,
  );
  // Cart 
  @GET('/vogofamily/cartlist?access_token={id}')
  Future<HttpResponse<CartListModel>> getCartList(@Path("id") String id);
  @POST('/vogofamily/addtocart')
  Future<HttpResponse> addToCart(@Body() AddTOcartModel body);
  @POST('/vogofamily/remove-product-cart')
  Future<HttpResponse> removecartItem(@Body() RemoveCartModel body);

  @POST('/vogofamily/update-cart')
  Future<HttpResponse> updateCart(@Body() UpdateCartModel body);
}
