import 'package:all_in_one/src/core/exception/custom_exception.dart';
import 'package:all_in_one/src/core/routes/app_pages.dart';
import 'package:all_in_one/src/core/service/cache/cache_keys.dart';
import 'package:all_in_one/src/core/service/cache/cache_service.dart';
import 'package:all_in_one/src/core/utils/util.dart';
import 'package:all_in_one/src/core/widgets/logger.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get_storage/get_storage.dart' show GetStorage;

import 'endpoints.dart';
import 'pretty_dio_logger.dart';

class RestClient {
  late Dio _dio;

  RestClient() {
    BaseOptions options = BaseOptions(
      baseUrl: API.dev,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio = Dio(options);
  }

  RestClient.dev() {
    BaseOptions options = BaseOptions(
      baseUrl: API.dev,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    _dio = Dio(options);
  }

  Future<Response<dynamic>> get(
    APIType apiType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);

    return _dio
        .get(path, queryParameters: data, options: standardHeaders)
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> delete(
    APIType apiType,
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);

    return _dio
        .delete(path, queryParameters: data, options: standardHeaders)
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> post(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .post(
          path,
          data: data,
          options: standardHeaders,
          queryParameters: queryParams,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  /// Supports media upload
  Future<Response<dynamic>> postFormData(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll({
        'Content-Type': 'multipart/form-data',
      });
    }

    return _dio
        .post(
          path,
          data: FormData.fromMap(data),
          options: standardHeaders,
          queryParameters: queryParams,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> put(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll(headers);
    }

    return _dio
        .put(
          path,
          data: data,
          options: standardHeaders,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  /// Supports media upload
  Future<Response<dynamic>> putFormData(
    APIType apiType,
    String path,
    Map<String, dynamic> data, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    _setDioInterceptorList();

    final standardHeaders = await _getOptions(apiType);
    if (headers != null) {
      standardHeaders.headers?.addAll({
        'Content-Type': 'multipart/form-data',
      });
    }
    data.addAll({
      '_method': 'PUT',
    });

    return _dio
        .post(
          path,
          data: FormData.fromMap(data),
          options: standardHeaders,
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> putFormDataToUrl(
    String url, {
    dynamic body,
    int? length,
  }) async {
    return _dio
        .put(
          url,
          data: body,
          options: Options(
            headers: {
              'Content-Type': 'application/octet-stream',
              Headers.contentLengthHeader: length,
            },
          ),
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  Future<Response<dynamic>> downloadFile(
    String url,
    String savePath,
  ) async {
    return _dio
        .download(
          url,
          savePath,
          onReceiveProgress: (received, total) {
            if (total != -1) {
              Log.info(
                  'Download progress: ${(received / total * 100).toStringAsFixed(0)}%');
            }
          },
        )
        .then((value) => value)
        .catchError(_getDioException);
  }

  dynamic _getDioException(error) {
    if (error is DioException) {
      Log.error(
          'DIO ERROR: ${error.type} ENDPOINT: ${error.requestOptions.baseUrl}${error.requestOptions.path}');
      final errorMessage = error.response?.data;
      switch (error.type) {
        case DioExceptionType.cancel:
          throw RequestCancelledException(
            001,
            'The request was cancelled. Please try again.',
          );
        case DioExceptionType.connectionTimeout:
          throw RequestTimeoutException(
            004,
            'Could not connect to the server. Please try again.',
          );
        case DioExceptionType.unknown:
          final message = errorMessage ?? '${error.response?.data['message']}';
          SnackBarService.showErrorSnackBar(message.toString());
          throw UnknownException(
            002,
          );
        case DioExceptionType.receiveTimeout:
          SnackBarService.showErrorSnackBar(
              error.message.toString().toString());
          throw ReceiveTimeoutException(
            004,
          );
        case DioExceptionType.sendTimeout:
          final message = errorMessage ?? '${error.response?.data['message']}';

          SnackBarService.showErrorSnackBar(message.toString().toString());
          throw RequestTimeoutException(
            004,
          );
        case DioExceptionType.badCertificate:
          throw BadRequestException(
            408,
            'Could not connect to the server.Please try again.',
          );
        case DioExceptionType.connectionError:
          SnackBarService.showErrorSnackBar(
              'You don not have internet connection');
          throw RequestTimeoutException(
            522,
          );
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              // throw CustomException(400, jsonEncode(error.response?.data), ""); /// Before
              throw CustomException(
                400,
                error.response?.data["message"]['message'],
                "",
              );
            case 403:
              CacheService().dispose();
              getx.Get.offAllNamed(Routes.login);
              break;
            case 401:
              CacheService().dispose();
              getx.Get.offAllNamed(Routes.login);
              break;
            case 404:
              final message =
                  errorMessage ?? '${error.response?.data['message']}';
              SnackBarService.showErrorSnackBar(message.toString());
              throw NotFoundException(
                404,
              );
            case 409:
              throw ConflictException(
                409,
                'Something went wrong. Please try again.',
              );
            case 408:
              final message =
                  errorMessage ?? '${error.response?.data['message']}';
              SnackBarService.showErrorSnackBar(message.toString());
              throw RequestTimeoutException(
                408,
              );
            case 500:
              final message = errorMessage ??
                  '${error.response?.data['message']['message']}';
              SnackBarService.showErrorSnackBar(message['message'].toString());
              throw InternalServerException(
                500,
              );
            case 422:
              final message =
                  errorMessage ?? '${error.response?.data['message']}';
              (message as Map).entries.first.value != null
                  ? SnackBarService.showErrorSnackBar(
                      message.toString().replaceAll(RegExp('[{}]'), ''),
                    )
                  : null;
              throw UnprocessableEntityException(
                422,
              );
            default:
              throw DefaultException(
                0002,
                errorMessage ?? 'Something went wrong. Please try again.',
              );
          }
      }
    } else {
      throw UnexpectedException(
        000,
        'Something went wrong. Please try again.',
      );
    }
  }

  void _setDioInterceptorList() {
    List<Interceptor> interceptorList = [];
    _dio.interceptors.clear();

    if (kDebugMode) {
      interceptorList.add(PrettyDioLogger());
    }
    _dio.interceptors.addAll(interceptorList);
  }

  Future<Options> _getOptions(APIType api) async {
    final box = GetStorage('Auth');
    final apiToken = await box.read(CacheKeys.token);

    switch (api) {
      case APIType.PUBLIC:
        return PublicApiOptions().options;

      case APIType.PROTECTED:
        return ProtectedApiOptions(apiToken).options;

      default:
        return PublicApiOptions().options;
    }
  }
}

abstract class ApiOptions {
  Options options = Options();
}

enum APIType { PUBLIC, PROTECTED }

class PublicApiOptions extends ApiOptions {
  PublicApiOptions() {
    super.options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-type': 'application/json',
    };
  }
}

class ProtectedApiOptions extends ApiOptions {
  ProtectedApiOptions(String apiToken) {
    super.options.headers = <String, dynamic>{
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiToken',
    };
  }
}
