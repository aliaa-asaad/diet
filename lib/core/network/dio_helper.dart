
import 'package:diet/core/constants/api_constance.dart';
import 'package:diet/core/handlers/shared_handler.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioHelper  {
  const DioHelper._();
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",
          // 'Accept-Language':
          //     AssetTranslations.getLanguage().locale.languageCode,
          // "Authorization": "Bearer ${getToken()}",
        },
        contentType: 'application/json',
      ),
    );
    addDioInterceptor();
  }

  static void addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static Future<Map<String, dynamic>> _getHeaders() async {

   String token = await SharedHandler.instance!
          .getData(key: SharedKeys().token, valueType: ValueType.string);
    return {
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
     // 'Accept-Language': lang.locale.languageCode,
      "Authorization":"Bearer $token",
    };
  }

  static Future<Response> get(
    final String url, {
    final Map<String, dynamic>? queries,
    final Map<String, dynamic>? data,
    final String? token,
    final String? baseUrl,
    final Map<String, dynamic>? headers,
    final Duration? duration,
  }) async {
    _dio.options.headers = headers ?? await _getHeaders();
    if (baseUrl != null) {
      _dio.options.baseUrl = baseUrl;
    }
    if (duration != null) {
      _dio.options.connectTimeout = duration;
      _dio.options.receiveTimeout = duration;
      _dio.options.sendTimeout = duration;
    }
    return await _dio.get(
      url,
      queryParameters: queries,
      data: data,
    );
  }

  static Future<Response> post(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, dynamic>? queryParameters,
    final String? token,
    final bool isFormData = false,
    final Duration? duration,
  }) async {
    _dio.options.headers = await _getHeaders();
    if (duration != null) {
      _dio.options.connectTimeout = duration;
      _dio.options.receiveTimeout = duration;
      _dio.options.sendTimeout = duration;
    }
    return await _dio.post(
      url,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> postFormData(
    final String url, {
    final FormData? data,
    final Map<String, dynamic>? queryParameters,
    final String? token,
  }) async {
    _dio.options.headers = await _getHeaders();

    return await _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> put(
    String url, {
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? data,
    final String? token,
    final bool isFormData = false,
  }) async {
    _dio.options.headers = await _getHeaders();
    return await _dio.put(
      url,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> delet(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, dynamic>? query,
    final String? token,
  }) async {
    _dio.options.headers = await _getHeaders();
    return await _dio.delete(
      url,
      data: data ?? {},
      queryParameters: query ?? {},
    );
  }

}