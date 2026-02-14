import 'package:dio/dio.dart';
import 'package:project_1/core/network/remote/api_endpoint.dart';

class DioHelper {
  static Dio? dio;
  static void init() {
    if (dio != null) {
      return;
    }
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  static Dio getDio() {
    if (dio != null) {
      return dio!;
    }
    init();

    return dio!;
  }

  static Future<Response> get({required String endPoint}) async {
    Response response = await getDio().get(endPoint);
    return response;
  }
}
