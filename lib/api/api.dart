// ignore_for_file: non_constant_identifier_names

import 'package:foody_app/model/base_result/base_result.dart';
import 'package:foody_app/model/cart/cart.dart';
import 'package:foody_app/model/login_info/login_info.dart';
import 'package:foody_app/model/member/change_info.dart';
import 'package:foody_app/model/member/change_password.dart';
import 'package:foody_app/model/member/register_request.dart';
import 'package:foody_app/model/order/order.dart';
import 'package:foody_app/model/order/order_request.dart';
import 'package:foody_app/model/product/product.dart';
import 'package:foody_app/model/member/login_request.dart';
import 'package:foody_app/model/receiver/receiver.dart';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api.g.dart';

@RestApi(baseUrl: 'https://myfoody290798.herokuapp.com/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('api/productDetail')
  Future<BaseResult<List<Product>>> getProducts();

  @GET('/member/carts/')
  Future<BaseResult<Cart>> getCarts();

  @POST('api/productDetail')
  Future<BaseResult<Product>> addProduct(@Body() Product product);

  @PUT("api/productDetail/{id}")
  Future<BaseResult<Product>> updateProduct(
      @Path() int id, @Body() Product product);

  @POST("/member/login")
  Future<BaseResult<LoginInfo>> doLogin(@Body() LoginRequest req);

  @POST("/member/register")
  Future<BaseResult> register(@Body() RegisterRequest req);

  @POST("/member/changePassword")
  Future<BaseResult> changePassword(@Body() ChangePassword req);

  @POST("/member/changeInfor")
  Future<BaseResult<LoginInfo>> changeInfo(@Body() ChangeInfo req);

  @GET("member/receiver")
  Future<BaseResult<List<Receiver>>> listReceiver();

  @GET("/member/receiver/{Re_Id}")
  Future<BaseResult<Receiver>> getReceiver(@Path() int Re_Id);

  @POST("/member/newReceiver")
  Future<BaseResult<Receiver>> newReceiver(@Body() Receiver req);

  @POST("/member/chosen")
  Future<BaseResult<Receiver>> select(@Body() Receiver req);

  @POST("/member/reset")
  Future<BaseResult<Receiver>> reset();

  @PUT("/member/updateReceiver/{Re_Id}")
  Future<BaseResult<Receiver>> updateReceiver(
      @Path() int Re_Id, @Body() Receiver req);

  @DELETE("/member/deleteReceiver/{Re_Id}")
  Future<BaseResult> deleteReceiver(@Path() int Re_Id);
  // @Queries() chơi productdetail paging123456

  @GET("member/orderMem")
  Future<BaseResult<List<Order>>> listOrder();

  @GET("/member/orderMem/{ORD_Id}")
  Future<BaseResult<Order>> getOrder(@Path() int ORD_Id);

  @POST("/member/orderMem")
  Future<BaseResult<Order>> order(@Body() OrderRequest req);
}
