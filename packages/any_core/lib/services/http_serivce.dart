import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

class HttpService extends getx.GetxService {
  static HttpService get to => getx.Get.find();

  final client = Dio();

  late final String host;

  Map<String, String> baseHeaders = {};

  HttpService({required this.host}) {
    client.options.baseUrl = host;
  }

  Future<Response<T>> get<T>(
    String path, {
    Map<String, String> headers = const {},
    Map<String, String> queries = const {},
    Object? body,
    Encoding? encoding,
    Duration timeout = const Duration(seconds: 20),
  }) async {
    try {
      final res = await client.get<T>(
        path,
        queryParameters: queries,
        options: Options(
          headers: headers,
          sendTimeout: timeout.inMilliseconds,
        ),
      );

      return res;
    } catch (e, stack) {
      stack.printError(info: e.toString());
      return Future.value(
        Response(
          requestOptions: RequestOptions(path: path),
          data: null,
        ),
      );
    }
  }

  Future<Response<T>> post<T>(
    String path, {
    Map<String, String> headers = const {},
    dynamic body,
    Encoding? encoding,
    Duration timeout = const Duration(seconds: 20),
  }) async {
    try {
      final res = await client.post<T>(
        path,
        data: body,
        options: Options(
          headers: headers,
          sendTimeout: timeout.inMilliseconds,
        ),
      );
      return res;
    } catch (e, stack) {
      stack.printError(info: e.toString());
      return Future.value(
        Response(
          requestOptions: RequestOptions(path: path),
          data: null,
        ),
      );
    }
  }
}
