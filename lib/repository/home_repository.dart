import 'package:dio/dio.dart';
import 'package:jds_new/api/api_constant.dart';
import 'package:jds_new/api/http_api_client.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/home/model/result.dart';
import 'package:jds_new/util/utils.dart';

class HomeRepository {
  Future<Map<String, dynamic>> getHomePage() async {
    var deviceId = await SessionManager.deviceId();

    var params = FormData.fromMap(
        {"device_id": deviceId, "customer_id": SessionManager.getUserId()});
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.homePage, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          //  log(response.data.toString());
          if (response.data != null) {
            final List<HomeData> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => HomeData.fromJson(e))
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
