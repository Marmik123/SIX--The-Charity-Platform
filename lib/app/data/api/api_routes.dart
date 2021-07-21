import 'package:dio/dio.dart';
import 'package:six/app/data/api/http_service.dart';

class API {
  static final HttpService _httpService = HttpService.getInstance();

  //BASE URL
  static String baseUrl = 'https://six.api.dharmatech.in/';
  //ROUTES
  static String envDataUrl = baseUrl + 'v1/getEnv';

  //FUNCTIONS
  static Future<Response?> getEnvData() {
    return _httpService.get(envDataUrl);
  }
}
