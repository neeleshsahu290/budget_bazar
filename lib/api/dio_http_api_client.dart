import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_constant.dart';
import 'api_exception.dart';
import 'http_api_client.dart';

/// Dio Http Api client to handle api request
class DioHttpApiClient implements HttpApiClient {
  late Dio dio;

  DioHttpApiClient({int timeOut = HttpApiClient.defaultTimeout}) {
    dio = getDioInstance(timeOut: timeOut);
  }

  /// Get dio instance
  Dio getDioInstance({int timeOut = HttpApiClient.defaultTimeout}) {
    BaseOptions options = BaseOptions(
      baseUrl: ApiConstant.apiBaseUrl,
      connectTimeout: Duration(seconds: timeOut),
      receiveTimeout: Duration(seconds: timeOut),
    );
    var dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: false));
    }
    return dio;
  }

  ///Function to handle dio error
  @override
  handleError(DioException e, {List? acceptedErrorResponse}) {
    debugPrint(
        "Dio error ${e.type} , ${e.response} , ${e.response?.statusCode} , ${e.message} , ${e.error} , ${e.requestOptions} , ");
    ApiException apiException = ApiException(
      errorMessage: "Oh! Something below is broken!",
      isDisplay: true,
    );
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        apiException.errorMessage =
            "It looks like the backend is taking too long for your request!";
        apiException.displayMessage =
            "It looks like the backend is taking too long for your request!";
        // message="Похоже, что бэкэнд отнимает слишком много времени на ваш запрос!";
        break;
      case DioExceptionType.sendTimeout:
        apiException.errorMessage =
            "It looks like the backend is taking too long for your request!";
        apiException.displayMessage =
            "It looks like the backend is taking too long for your request!";

        break;
      case DioExceptionType.receiveTimeout:
        apiException.errorMessage =
            "It looks like the backend is taking too long for your request!";
        apiException.displayMessage =
            "It looks like the backend is taking too long for your request!";

        break;
      case DioExceptionType.badResponse:
        if (e.response != null) {
          if (acceptedErrorResponse!.contains(e.response?.statusCode)) {
            return e.response;
          }
          switch (e.response?.statusCode) {
            case 400:
              if (acceptedErrorResponse.contains(400)) {
                apiException.errorMessage =
                    e.response?.toString() ?? "Oh! Something below is broken!";
                apiException.displayMessage = "Oh! Something below is broken!";
                return e.response;

                /// bad request and system want to a response for it then return error response
              }
              apiException.errorMessage =
                  e.response?.toString() ?? "Oh! Something below is broken!";
              apiException.displayMessage = "Oh! Something below is broken!";
              break;

            case 401:
              if (acceptedErrorResponse.contains(401)) {
                apiException.errorMessage =
                    e.response?.toString() ?? "Oh! Something below is broken!";
                apiException.displayMessage = "Oh! Something below is broken!";
                return e.response;

                /// bad request and system want to a response for it then return error response
              }
              apiException.errorMessage =
                  e.response?.toString() ?? "Oh! Something below is broken!";
              apiException.displayMessage = "Oh! Something below is broken!";
              break;

            case 404:
              // apiException.errorMessage= e.response?.toString()??"Похоже, что система не может найти запрошенный вами ресурс!";
              apiException.errorMessage = e.response?.toString() ??
                  "It looks like the system cannot find the resource you requested!";
              apiException.displayMessage =
                  "It looks like the system cannot find the resource you requested!";
              break;
            case 500:
              apiException.errorMessage =
                  e.response?.toString() ?? "Oh! Something below is broken1!";
              apiException.displayMessage = "Internal server error";
              return e.response;
          }
        }
        break;

      case DioExceptionType.unknown:
        if (e.response != null) {
          if (acceptedErrorResponse!.contains(e.response?.statusCode)) {
            return e.response;
          }
        }
        if (e.error != null && e.error.toString().contains('SocketException')) {
          apiException.errorMessage = "No Network! Unable to contact servers!";
          apiException.displayMessage =
              "No Network! Unable to contact servers!";
        } else {
          apiException.errorMessage = "Oh! Something below is broken!";
          apiException.displayMessage = "Oh! Something below is broken!";
        }
        break;
      default:
    }
    return {"status": 0, "message": apiException};
  }

  @override
  delete(String url, payload,
      {required Map<String, dynamic> header,
      List? acceptedErrorResponse}) async {
    setDefaultHeaders(header);
    try {
      return await dio.delete(url, options: Options(headers: header));
    } on DioException catch (e) {
      return handleError(e, acceptedErrorResponse: acceptedErrorResponse ?? []);
    }
  }

  @override
  get(String url,
      {Map<String, dynamic>? header,
      List? acceptedErrorResponse,
      Map<String, dynamic>? queryParameters}) async {
    setDefaultHeaders(header);
    try {
      return await dio.get(url,
          options: Options(
            headers: header,
          ),
          queryParameters: queryParameters);
    } on DioException catch (e) {
      // ApiException apiException=ApiException(errorMessage:"Ой! Что-то внизу сломано! test",isDisplay: true,);
      // return apiException;
      return handleError(e, acceptedErrorResponse: acceptedErrorResponse ?? []);
    }
  }

  @override
  post(String url, payload,
      {Map<String, dynamic>? header,
      List? acceptedErrorResponse,
      Map<String, dynamic>? queryParameters}) async {
    setDefaultHeaders(header);
    try {
      return await dio.post(url,
          data: payload,
          options: Options(
            headers: header,
          ),
          queryParameters: queryParameters);
    } on DioException catch (e) {
      return handleError(e, acceptedErrorResponse: acceptedErrorResponse ?? []);
    }
  }

  @override
  put(String url, payload,
      {required Map<String, dynamic> header,
      List? acceptedErrorResponse}) async {
    setDefaultHeaders(header);
    try {
      return await dio.put(url,
          data: payload, options: Options(headers: header));
    } on DioException catch (e) {
      return handleError(e, acceptedErrorResponse: acceptedErrorResponse ?? []);
    }
  }

  /// Function to get default header
  setDefaultHeaders(header) {
    header ??= {
      "Content-Type": "application/json",
    };
  }
}
