import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //كود هيتنفذ مع كل request
    options.headers.addAll({});
    super.onRequest(options, handler);
  }
}
