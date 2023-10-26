import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jds_new/api/api_constant.dart';
import 'package:jds_new/api/http_api_client.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/login/model/login_model.dart';
import 'package:jds_new/screens/login/model/verify_model.dart';
import 'package:jds_new/screens/orders/model/order_model_data.dart';
import 'package:jds_new/util/utils.dart';

class OrderRepository {
  Future<Map<String, dynamic>> userOrderList() async {
    var deviceId = await SessionManager.deviceId();
    //  log("deviceId" + deviceId.toString());

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
    });
    log({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
    }.toString());
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.customerOrderList, params,
          acceptedErrorResponse: [400, 401]);

      if (response is Response) {
        log(response.data.toString());
        if (isSuccess(response.statusCode!)) {
          if (response.data != null && response.data['code'] == 0) {
            final List<OrderModelData> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => OrderModelData.fromJson(e))
                    .toList();
            return {'status': success, 'data': dataList};
          } else {
            return {
              'status': error,
              'error': response.data['message'],
            };
          }
        } else {
          return {
            'status': error,
            'error': "Failed to load Test",
          };
        }
      } else {
        return {
          'status': failure,
          'error': response["message"] ?? failureMessage
        };
      }
    } catch (e) {
      return {'status': error, 'error': failureMessage};
    }
  }
}
