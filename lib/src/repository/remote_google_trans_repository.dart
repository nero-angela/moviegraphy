import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:prography/core/base/base_remote_repository.dart';
import 'package:prography/core/helper/network_helper.dart';

class RemoteGoogleTransRepository extends BaseRemoteRepository {
  const RemoteGoogleTransRepository({required super.dio});

  Future<String> translate(
    String q, [
    String from = 'auto',
    String to = 'ko',
  ]) async {
    try {
      Response res = await dio.get(NetworkHelper.googleTransAPIUrl, queryParameters: {
        'client': 'gtx',
        'dt': 't',
        'sl': from,
        'tl': to,
        'q': q,
      });
      List<String> sentenceList = [];
      for (int i = 0; i < res.data[0].length; i++) {
        String sentence = res.data[0][i][0];
        sentenceList.add(sentence.trim());
      }
      return sentenceList.join(' ');
    } catch (e, s) {
      log('Failed to translate', error: e, stackTrace: s);
      return q;
    }
  }
}
