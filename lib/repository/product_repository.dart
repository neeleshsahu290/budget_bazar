import 'package:dio/dio.dart';
import 'package:jds_new/api/api_constant.dart';
import 'package:jds_new/api/http_api_client.dart';
import 'package:jds_new/constants/constant.dart';
import 'package:jds_new/helper/session_manager.dart';
import 'package:jds_new/screens/categories/model/category_data.dart';
import 'package:jds_new/screens/product_details/model/product_data.dart';
import 'package:jds_new/screens/search/model/search_data.dart';

import 'package:jds_new/util/utils.dart';

class ProductRepository {
  Future<Map<String, dynamic>> getProductData({required var productId}) async {
    var deviceId = await SessionManager.deviceId();

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
      "products_id": productId
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.getProductDetails, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          //  log(response.data.toString());
          if (response.data != null) {
            final List<ProductData> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => ProductData.fromJson(e))
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

  Future<Map<String, dynamic>> getCategoryData(
      {required var productCatId, required var productMainCatId}) async {
    var deviceId = await SessionManager.deviceId();

    var params = FormData.fromMap({
      "device_id": deviceId,
      "customer_id": SessionManager.getUserId(),
      "products_main_category_id": productMainCatId,
      "products_category_id": productCatId
    });
    try {
      final response = await HttpApiClient.getInstance().post(
          ApiConstant.getProductList, params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          //  log(response.data.toString());
          if (response.data != null) {
            final List<CategoryData> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => CategoryData.fromJson(e))
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

  Future<Map<String, dynamic>> searchProducts({
    required var keyword,
  }) async {
    var deviceId = await SessionManager.deviceId();

    var params = {
      "device_id": deviceId,
      "keyword": keyword,
    };
    try {
      final response = await HttpApiClient.getInstance().get(
          ApiConstant.getGlobalSearchData,
          queryParameters: params,
          acceptedErrorResponse: [400, 401]);
      // log(response.data["results"].toString());

      if (response is Response) {
        if (isSuccess(response.statusCode!)) {
          //  log(response.data.toString());
          if (response.data != null) {
            final List<SearchData> dataList =
                (response.data["results"] as List<dynamic>)
                    .map((e) => SearchData.fromJson(e))
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
