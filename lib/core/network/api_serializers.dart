// Paste this file inside lib/data/network/ or lib/network/
// Then import it in your API class where Parser.FlutterCompute is used

// Example:
// @GET('/some-endpoint')
// Future<SomeModel> fetchSomething(@Body() RequestBody body);
// Use like:
//   fromJson: deserializeSomeModel,
//   toJson: serializeSomeModel

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

T deserializeModel<T>(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) => fromJson(json);
Map<String, dynamic> serializeModel<T>(T object, Map<String, dynamic> Function(T) toJson) => toJson(object);

CategoryResponse deserializeCategory(Map<String, dynamic> json) => CategoryResponse.fromJson(json);
ProductDetailModel deserializeProductDetail(Map<String, dynamic> json) => ProductDetailModel.fromJson(json);
ProductListResponse deserializeProductList(Map<String, dynamic> json) => ProductListResponse.fromJson(json);
List<ProductListResponse> deserializeProductListArray(List<dynamic> json) => json.map((e) => ProductListResponse.fromJson(e)).toList();

ProductsByCategoryModel deserializeProductsByCategory(Map<String, dynamic> json) => ProductsByCategoryModel.fromJson(json);
List<ProductsByCategoryModel> deserializeProductsByCategoryList(List<dynamic> json) => json.map((e) => ProductsByCategoryModel.fromJson(e)).toList();

CartListModel deserializeCartList(Map<String, dynamic> json) => CartListModel.fromJson(json);
AddWishListResponse deserializeAddWishlist(Map<String, dynamic> json) => AddWishListResponse.fromJson(json);
AllWishListModel deserializeAllWishlist(Map<String, dynamic> json) => AllWishListModel.fromJson(json);
ForgotresModel deserializeForgot(Map<String, dynamic> json) => ForgotresModel.fromJson(json);
OrderListModel deserializeOrderList(Map<String, dynamic> json) => OrderListModel.fromJson(json);
OrderDetails deserializeOrderDetails(Map<String, dynamic> json) => OrderDetails.fromJson(json);
SocialLoginResponsemodel deserializeSocialLogin(Map<String, dynamic> json) => SocialLoginResponsemodel.fromJson(json);
Logoutresponse deserializeLogout(Map<String, dynamic> json) => Logoutresponse.fromJson(json);
LoginBody deserializeLoginBody(Map<String, dynamic> json) => LoginBody.fromJson(json);
RegisterRequest deserializeRegister(Map<String, dynamic> json) => RegisterRequest.fromJson(json);
AddTOcartModel deserializeAddToCart(Map<String, dynamic> json) => AddTOcartModel.fromJson(json);
RemoveCartModel deserializeRemoveCart(Map<String, dynamic> json) => RemoveCartModel.fromJson(json);
UpdateCartModel deserializeUpdateCart(Map<String, dynamic> json) => UpdateCartModel.fromJson(json);
ForgotbodyModel deserializeForgotBody(Map<String, dynamic> json) => ForgotbodyModel.fromJson(json);
AddWishListBody deserializeWishListBody(Map<String, dynamic> json) => AddWishListBody.fromJson(json);
AddressAddModel deserializeAddress(Map<String, dynamic> json) => AddressAddModel.fromJson(json);
ChekOutBody deserializeCheckout(Map<String, dynamic> json) => ChekOutBody.fromJson(json);
SocialLoginModelBody deserializeSocialLoginBody(Map<String, dynamic> json) => SocialLoginModelBody.fromJson(json);

Map<String, dynamic> serializeLoginBody(LoginBody model) => model.toJson();
Map<String, dynamic> serializeRegister(RegisterRequest model) => model.toJson();
Map<String, dynamic> serializeAddToCart(AddTOcartModel model) => model.toJson();
Map<String, dynamic> serializeRemoveCart(RemoveCartModel model) => model.toJson();
Map<String, dynamic> serializeUpdateCart(UpdateCartModel model) => model.toJson();
Map<String, dynamic> serializeForgotBody(ForgotbodyModel model) => model.toJson();
Map<String, dynamic> serializeWishListBody(AddWishListBody model) => model.toJson();
Map<String, dynamic> serializeAddress(AddressAddModel model) => model.toJson();
Map<String, dynamic> serializeCheckout(ChekOutBody model) => model.toJson();
Map<String, dynamic> serializeSocialLoginBody(SocialLoginModelBody model) => model.toJson();
