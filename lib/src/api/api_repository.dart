import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiRepository {
  ApiRepository({@required this.url, this.payload});

  final Map payload;
  final String url;

  Dio _dio = Dio();

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) {
    _dio.get(this.url, queryParameters: this.payload).then((response) {
      if (onSuccess != null) {
        onSuccess(response.data);
      }
    }).catchError(((error) {
      if (onError != null) onError(error);
    }));
  }
}
