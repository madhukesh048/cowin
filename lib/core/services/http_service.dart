import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HttpService {
  Future<T?> makeGetRequest<T>({
    @required String? url,
    Map<String, dynamic>? headers,
  }) async {
    Response<T> response = await Dio().get<T>(
      url!,
      options: Options(headers: headers),
    );
    return response.data;
  }
}
