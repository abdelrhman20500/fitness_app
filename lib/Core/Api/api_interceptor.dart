import 'package:dio/dio.dart';

import '../cached/shared_pref.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // final token = SharedPref.getToken();

    // if (token != null && token.isNotEmpty) {
    //   // هنا تقدر تغير الـ prefix حسب الـ API بتاعك
    //   options.headers["Authorization"] = "Bearer $token";
    // }

    // ممكن تضيف أي headers إضافية هنا
    options.headers["Content-Type"] = "application/json";
    options.headers["Accept-Language"] = "en";

    super.onRequest(options, handler);
  }
}
