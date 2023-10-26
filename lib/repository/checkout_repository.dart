
import 'package:dio/dio.dart';
import 'package:jds_new/api/api_constant.dart';
import 'package:jds_new/api/http_api_client.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/checkout/model/user_details_model.dart';

import 'package:jds_new/screens/shopping_cart/model/cart_data.dart';

import 'package:jds_new/util/utils.dart';

class CheckoutRepository {
  Future<Map<String, dynamic>> checkoutOrder() async {
    var deviceId = await SessionManager.deviceId();
    //  log("deviceId" + deviceId.toString());

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
      "payment_mode": "1",
      "payment_gateway_response": "",
      "payment_gateway": "",
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.placeOrder, params,
          acceptedErrorResponse: [400, 401]);

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          if (response.data != null && response.data['code'] == 0) {
            return {'status': success, 'data': response.data['message']};
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

  Future<Map<String, dynamic>> getUserDetails() async {
    var deviceId = await SessionManager.deviceId();
    //  log("deviceId" + deviceId.toString());

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.customerDetails, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          //  log(response.data.toString());
          if (response.data != null) {
            final List<UserDetailsModel> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => UserDetailsModel.fromJson(e))
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

  Future<Map<String, dynamic>> removeAddress(
      {required var customerShippingAddressId}) async {
    var deviceId = await SessionManager.deviceId();
    //  log("deviceId" + deviceId.toString());

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
      "customer_shipping_address_id": customerShippingAddressId.toString(),
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.removeCustomerShippingAddress, params,
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

  Future<Map<String, dynamic>> addAddress(
      {required var address,
      required var flat,
      required var area,
      required var landmark,
      required var city,
      required var pincode,
      required var isDefault,
      required var customerShippingAddressId,
      required var societyName,
      required var addressType}) async {
    var deviceId = await SessionManager.deviceId();
    //  log("deviceId" + deviceId.toString());

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
      "address": address,
      "flat": flat,
      "area": area,
      "landmark": landmark,
      "city": city,
      "pincode": pincode,
      "is_default": isDefault,
      "customer_shipping_address_id": customerShippingAddressId,
      "society_name": societyName,
      "address_type": addressType.toString(),
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.addUpdateCustomerShippingAddress, params,
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
}
