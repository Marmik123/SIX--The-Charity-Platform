import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_x_starter_kit/app/data/config/encryption.dart';
import 'package:get_x_starter_kit/app/data/config/logger.dart';
import 'package:get_x_starter_kit/app/data/local/user_provider.dart';
import 'package:get_x_starter_kit/app/data/remote/api_service/service.dart';

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

InterceptorsWrapper encryptBody() {
  return InterceptorsWrapper(
    onRequest: (options, handler) {
      var method = options.method;

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
      handler.next(options); //continue
    },
  );
}

class APIService {
  static final Dio _dio = Dio();

  static late RestClient _restClient;

  static RestClient get apiClient => _restClient;

  static void initializeAPIService({
    bool encryptData = false,
    String authHeader = 'authToken',
    String xAPIKeyHeader = 'x-api-key',
    String xAPIKeyValue = 'x-api-key',
  }) {
    _dio.options.headers.addAll(<String, dynamic>{
      xAPIKeyHeader: xAPIKeyValue,
    });
    if (UserProvider.isLoggedIn) {
      _dio.options.headers.addAll(<String, dynamic>{
        authHeader: UserProvider.authToken,
      });
    }
    //Add interceptor for encryption layer
    if (encryptData) {
      logI('Data will be encrypted for POST / PUT / PATCH');
      _dio.interceptors.add(encryptBody());
    }
    if (kDebugMode) {
      //Add interceptor for console logs
      _dio.interceptors.add(dioLoggerInterceptor);
    }

    _restClient = RestClient(_dio);
    // _restClient.getTasks();
  }
}
