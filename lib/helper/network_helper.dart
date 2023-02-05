import 'dart:developer';

import 'package:dio/dio.dart';

abstract class NetworkHelper {
  static const String movieApiUrl = 'https://yts.mx/api/v2';

  static final Dio dio = Dio()
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // 요청시
          log('REQ : [${options.method}] ${options.uri}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          // 수신시
          log('RES : [${response.statusCode}] ${response.requestOptions.uri}');
          return handler.next(response);
        },
        onError: (DioError e, handler) {
          // 에러시
          log('ERR : [${e.response?.statusCode}] ${e.requestOptions.uri}');
          return handler.next(e);
        },
      ),
    );
}
