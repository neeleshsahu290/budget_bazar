import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:jds_new/api/api_constant.dart';
import 'package:jds_new/api/http_api_client.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';

import 'package:jds_new/screens/shopping_cart/model/cart_data.dart';

import 'package:jds_new/util/utils.dart';

class CartRepository {
  Future<Map<String, dynamic>> getCartData() async {
    var deviceId = await SessionManager.deviceId();
    //  log("deviceId" + deviceId.toString());

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.productCartList, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          //  log(response.data.toString());
          if (response.data != null) {
            final List<CartData> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => CartData.fromJson(e))
                    .toList();

            return {'status': success, 'data': dataList};
          } else {
            return {
              'status': error,
              'error': noDataText,
            };
          }
        } else {
          return {
            'status': error,
            'error': "Failed to load category list",
          };
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> addProductToCart(
      {required var productId,
      required var quantity,
      required var productUnitTypeId}) async {
    var deviceId = await SessionManager.deviceId();
    // log("deviceId" + deviceId.toString());
    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
      "products_id": productId,
      "qty": quantity,
      "products_unit_type_id": productUnitTypeId
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.addProductCart, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          log(response.data.toString());
          if (response.data != null) {
            // final List<CartData> dataList =
            //     (response.data["results"] as List<dynamic>)
            //         .map((e) => CartData.fromJson(e))
            //         .toList();

            return {'status': success, 'data': response.data["message"]};
          } else {
            return {
              'status': error,
              'error': noDataText,
            };
          }
        } else {
          return {
            'status': error,
            'error': "Failed to load category list",
          };
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> removeProductToCart(
      {required var productId,
      required var quantity,
      required var productUnitTypeId}) async {
    var deviceId = await SessionManager.deviceId();

    var params = FormData.fromMap({
      'customer_id': SessionManager.getUserId(),
      'products_cart_id': productId,
      "device_id": deviceId,
      "products_unit_type_id": productUnitTypeId,
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.removeProductFromCart, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          log(response.data.toString());
          if (response.data != null) {
            // final List<CartData> dataList =
            //     (response.data["results"] as List<dynamic>)
            //         .map((e) => CartData.fromJson(e))
            //         .toList();

            return {'status': success, 'data': response.data["message"]};
          } else {
            return {
              'status': error,
              'error': noDataText,
            };
          }
        } else {
          return {
            'status': error,
            'error': "Failed to load category list",
          };
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': e.toString()};
    }
  }

  Future<Map<String, dynamic>> checkoutCart(
      {required var productId,
      required var quantity,
      required var productUnitTypeId}) async {
    var deviceId = await SessionManager.deviceId();

    var params = FormData.fromMap({
      "customer_id": SessionManager.getUserId(),
      "payment_mode": "1",
      "payment_gateway_response": "",
      "payment_gateway": "",
      "device_id": deviceId
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.placeOrder, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          log(response.data.toString());
          if (response.data != null) {
            // final List<CartData> dataList =
            //     (response.data["results"] as List<dynamic>)
            //         .map((e) => CartData.fromJson(e))
            //         .toList();

            return {'status': success, 'data': response.data["message"]};
          } else {
            return {
              'status': error,
              'error': noDataText,
            };
          }
        } else {
          return {
            'status': error,
            'error': "Failed to load category list",
          };
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': e.toString()};
    }
  }
}
