import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:six/app/data/config/encryption.dart';
import 'package:six/app/data/config/logger.dart';
import 'package:six/app/data/local/user_provider.dart';

final dioLoggerInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    var headers = '';
    options.headers.forEach((key, dynamic value) {
      headers += '| $key: $value';
    });
    print(
        '┌------------------------------------------------------------------------------');
    print('''| [DIO] Request: ${options.method} ${options.uri}
| ${options.data.toString()}
| Headers:\n$headers''');
    print(
        '├------------------------------------------------------------------------------');
    handler.next(options); //continue
  },
  onResponse: (response, handler) async {
    print(
        '| [DIO] Response [code ${response.statusCode}]: ${response.data.toString()}');
    print(
        '└------------------------------------------------------------------------------');
    handler.next(response);
    // return response; // continue
  },
  onError: (error, handler) async {
    print('| [DIO] Error: ${error.toString()}');
    print(
        '└------------------------------------------------------------------------------');
    handler.next(error); //continue
  },
);

InterceptorsWrapper addAuthToken({String authTokenHeader = 'authToken'}) {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      options.headers.addAll(<String, dynamic>{
        authTokenHeader: 'Bearer ${UserProvider.authToken}',
      });
      handler.next(options); //continue
    },
  );
}

InterceptorsWrapper encryptBody() {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      var method = options.method;

      if (options.headers['encrypt'] as bool) {
        switch (method) {
          case 'POST':
          case 'PUT':
          case 'PATCH':
            logW('encrypting $method method');
            if (options.data.runtimeType.toString() ==
                '_InternalLinkedHashMap<String, dynamic>') {
              logI('Data will be encrypted before sending request');
              options.data = <String, dynamic>{
                'data':
                    AppEncryption.encrypt(plainText: jsonEncode(options.data)),
              };
            } else {
              logI(
                  'Skipping encryption for ${options.data.runtimeType} data type');
            }

            break;
          default:
            logWTF('Skipping encryption for $method method');
            break;
        }
      }
      handler.next(options); //continue
    },
  );
}

class APIService {
  static final Dio _dio = Dio();

  static late String prodBaseApiUrl;
  static late String devBaseApiUrl;

  static String get baseUrl => kReleaseMode ? prodBaseApiUrl : devBaseApiUrl;

  static void initializeAPIService({
    bool encryptData = false,
    String authHeader = 'Authorization',
    String xAPIKeyHeader = 'x-api-key',
    String xAPIKeyValue = 'x-api-key',
    required String devBaseUrl,
    required String prodBaseUrl,
  }) {
    devBaseApiUrl = devBaseUrl;
    prodBaseApiUrl = prodBaseUrl;

    _dio.options.headers.addAll(<String, dynamic>{
      xAPIKeyHeader: xAPIKeyValue,
    });
    /*if (UserProvider.isLoggedIn) {
      _dio.options.headers.addAll(<String, dynamic>{
        authHeader: UserProvider.authToken,
      });
    }*/
    _dio.interceptors.add(addAuthToken(authTokenHeader: authHeader));
    //Add interceptor for encryption layer
    if (encryptData) {
      logI('Data will be encrypted for POST / PUT / PATCH');
      _dio.interceptors.add(encryptBody());
    }
    if (kDebugMode) {
      //Add interceptor for console logs
      _dio.interceptors.add(dioLoggerInterceptor);
    }

    // _restClient.getTasks();
  }

  static Future<Response<Map<String, dynamic>?>> get({
    required String path,
    Map<String, dynamic>? params,
    bool encrypt = false,
  }) async {
    return await _dio.get<Map<String, dynamic>?>(
      baseUrl + path,
      queryParameters: params,
      options: Options(headers: <String, dynamic>{
        'encrypt': encrypt,
      }),
    );
  }

  static Future<Response<Map<String, dynamic>?>> post({
    required String path,
    FormData? data,
    Map<String, dynamic>? params,
    bool encrypt = true,
  }) async {
    return await _dio.post<Map<String, dynamic>?>(
      baseUrl + path,
      data: data,
      queryParameters: params,
      options: Options(headers: <String, dynamic>{
        'encrypt': encrypt,
      }),
    );
  }
}
