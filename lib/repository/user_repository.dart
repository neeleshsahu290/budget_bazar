import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:jds_new/api/api_constant.dart';
import 'package:jds_new/api/http_api_client.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/login/model/login_model.dart';
import 'package:jds_new/screens/login/model/verify_model.dart';
import 'package:jds_new/util/utils.dart';

class UserRepository {
  Future<Map<String, dynamic>> loginUser({required var mobileNo}) async {
    var deviceId = await SessionManager.deviceId();

    var params =
        FormData.fromMap({"mobileno": mobileNo, "device_id": deviceId});
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.customerLogin, params,
          acceptedErrorResponse: [400, 401]);

      if (response is Response) {
        log(response.data.toString());
        if (isSuccess(response.statusCode!)) {
          if (response.data != null && response.data['code'] == 0) {
            final List<LoginModel> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => LoginModel.fromJson(e))
                    .toList();
            return {
              'status': success,
              'data': (response.data['message'], dataList.first)
            };
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

  Future<Map<String, dynamic>> registerUser({required var mobileNo}) async {
    var deviceId = await SessionManager.deviceId();

    var params =
        FormData.fromMap({"mobileno": mobileNo, "device_id": deviceId});

    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.customerLogin, params,
          acceptedErrorResponse: [400, 401]);

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          if (response.data != null && response.data['code'] == 0) {
            final List<LoginModel> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => LoginModel.fromJson(e))
                    .toList();
            return {'status': success, 'data': dataList.first};
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

  Future<Map<String, dynamic>> verifyUser(
      {required var otp, required var customerId}) async {
    var deviceId = await SessionManager.deviceId();

    var params = FormData.fromMap(
        {"otp": otp, "device_id": deviceId, "customer_id": customerId});
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.verifyOtp, params,
          acceptedErrorResponse: [400, 401]);

      if (response is Response) {
        log(response.data.toString());
        if (isSuccess(response.statusCode!)) {
          if (response.data != null && response.data['code'] == 0) {
            final List<VerifyModel> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => VerifyModel.fromJson(e))
                    .toList();
            return {'status': success, 'data': dataList.first};
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

  // Future<Map<String, dynamic>> getUserData() async {
  //   try {
  //     final response = await HttpApiClient.getInstance().post(
  //         ApiConstant.userData, {"uid": SessionManager.getString(userUid)},
  //         acceptedErrorResponse: [400, 401]);

  //     if (response is Response) {
  //       if (isSuccess(response.statusCode!)) {
  //         if (response.data != null) {
  //           return {
  //             'status': success,
  //             'data': UserHomeData.fromMap(response.data['data'])
  //           };
  //         } else {
  //           return {
  //             'status': error,
  //             'error': noDataText,
  //           };
  //         }
  //       } else {
  //         return {
  //           'status': error,
  //           'error': "Failed to load Test",
  //         };
  //       }
  //     } else {
  //       return {
  //         'status': failure,
  //         'error': response["message"] ?? failureMessage
  //       };
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     return {'status': error, 'error': failureMessage};
  //   }
  // }
}
