import 'package:dio/dio.dart';

class BaseRemoteRepository {
  const BaseRemoteRepository({
    required this.dio,
  });

  final Dio dio;
}
