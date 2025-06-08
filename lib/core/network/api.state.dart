import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vogo/data/models/addAdressModel.dart';
import 'package:vogo/data/models/addTocart.model.dart';

import 'package:vogo/data/models/addwishlist.model.dart';
import 'package:vogo/data/models/allwishlist.model.dart';
import 'package:vogo/data/models/cartsList.model.dart';
import 'package:vogo/data/models/category.model.dart';
import 'package:vogo/data/models/checkout.model.dart';
import 'package:vogo/data/models/forgotBodyModel.dart';
import 'package:vogo/data/models/forgotResModel.dart';
import 'package:vogo/data/models/login.body.dart';
import 'package:vogo/data/models/logout.model.dart';
import 'package:vogo/data/models/orderDetails.model.dart';
import 'package:vogo/data/models/orderList.model.dart';
import 'package:vogo/data/models/product.detail.model.dart';
import 'package:vogo/data/models/product.model.dart';
import 'package:vogo/data/models/pruduts.byCategorymodel.dart';
import 'package:vogo/data/models/register.req.model.dart';
import 'package:vogo/data/models/remove.cart.model.dart';
import 'package:vogo/data/models/socialLogin.model.dart';
import 'package:vogo/data/models/socialLogin.res.dart';
import 'package:vogo/data/models/update.cartmodel.dart';

part 'api.state.g.dart';

@RestApi(baseUrl: 'https://vogo.family/wp-json',)
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
  @POST('/vogofamily/forgot')
  Future<HttpResponse<ForgotresModel>> forgot(@Body() ForgotbodyModel body);
  // Wishlist
  @POST('/vogofamily/add-to-wishlist') 
  Future<HttpResponse<AddWishListResponse>> addToWishList(@Body() AddWishListBody body);
  @GET('/vogofamily/showwishlist?access_token={id}&page=1&per_page=105')
  Future<HttpResponse<AllWishListModel>> getAllWishList(@Path("id") String id);
  @POST('/vogofamily/product-remove-wishlist')
  Future<HttpResponse> removeWishListItem(@Body() AddWishListBody body);
  // address
  @POST('/vogofamily/Update-Address')
  Future<HttpResponse> addAdress(@Body() AddressAddModel boduy);
  @GET('/vogofamily/Address-List?access_token={id}')
  Future<HttpResponse> getAddress(@Path('id') String id);
  // orders
  @POST('/vogofamily/checkout')
  Future<HttpResponse> checkOut(@Body() ChekOutBody body);
  @GET('/vogofamily/order-list?access_token={id}')
  Future<OrderListModel> fetchOrders(@Path('id') String id);
  @GET('/vogofamily/order-detail?access_token={userid}&order_id={order_id}')
  Future<OrderDetails> fetchOrderDetails(@Path('userid') String id, @Path('order_id') String orderid);
  @POST('/vogofamily/Social_login')
  Future<SocialLoginResponsemodel> socialLogin(@Body() SocialLoginModelBody body );
  @GET('/vogofamily/empty-cart?access_token={id}')
  Future<HttpResponse> emptyCart(@Path('id') String id);
  @GET('/vogofamily/logout?access_token={id}')
  Future<Logoutresponse> logout(@Path('id') String id);

}


